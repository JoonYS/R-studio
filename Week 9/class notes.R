library(ggplot2)
library(rpart)
library(neuralnet)
install.packages("neuralnet")


### Unsupervised analysis ###
# Dendogram
heart = read.csv("~week7/week7_data/heart.csv")

head(heart)

# Let's use numeric variables
#sapply ()= run the same functionon every column in data fram( or each list)
sapply(heart, is.numeric)


# keep numeric variables
heart_sub = heart[,sapply(heart, is.numeric)]
head(heart_sub)

# 44, 50 look quite different from the rest 

summary(heart_sub)
heart_sub[44,]
hist(heart_sub$chol)


#PCA

heart_pca = prcomp(heart_sub[,-8], scale = TRUE) # scaling evens out the importance of each

# This one does not like missing values
colSums(is.na(heart_sub)) # how many from each column are na
is.na(c(0,3,5,NA,2))

#handiling missing values
# -remove samples with missing values
# -set the missing value to the average/median measurement of that column
#- Fancier methods out there(if you have lots)

heart_forPCA = na.omit(heart_sub)
dim (heart_forPCA)


heart_pca = prcomp(heart_forPCA[,-8], scale = TRUE)

class(heart_pca)
names(heart_pca)

# sample scores are in 'x'
head( heart_pca$x)
dim(heart_pca$ x)

#sdev is "amount of information provided by each column
# we use variance (sdev^2)
barplot(heart_pca$sdev^2)

pca_plot = as.data.frame(heart_pca$x)
ggplot(pca_plot, aes(x = PC1, y = PC2)) + geom_point()

ggplot(pca_plot, aes(x = PC1, y = PC2, label = rownames(pca_plot)))+ geom_text()
# does disease correlate with similarirty

pca_plot$disease = factor(heart_forPCA$disease)

levels (pca_plot$disease) = c("control", "disease")
head(pca_plot$disease)

ggplot(pca_plot, aes( x = PC1, y = PC2, colour = disease)) + geom_point()


### supervised learning ###
# RPART- recursive partitioning (rules that best split the data
library(rpart)

# example data
?kyphosis
head(kyphosis)

rpart_model = rpart(Kyphosis ~ Age + Number + Start, data = kyphosis)
rpart_model = rpart(Kyphosis ~ ., data = kyphosis)

rpart_model
# Plot the decision tree
par(xpd = TRUE) # setting up margins
plot(rpart_model)
text(rpart_model, use.n = TRUE)

#If TRUE = MOve LEFT
library(neuralnet)
?neuralnet

nn = neuralnet(Kyphosis ~., data = kyphosis)
plot(nn)
# 2 hidden layers, 3 neruons then 2
nn = neuralnet(Kyphosis ~., data = kyphosis,
               hidden = c(3,2))

# Train & Test
dim(kyphosis)

train_ind = sample(1:nrow(kyphosis), size = 60)
train_ind

kyph_train = kyphosis[train_ind,]
kyph_test = kyphosis[-train_ind,]

nn = neuralnet(Kyphosis ~., data = kyph_train)

# Test data usign predict function (and our test set)

nn_pred = predict(nn, kyph_test)
nn_pred

table(kyph_train$kyphosis)

kyph_check = cbind(kyph_test, nn_pred)
View(kyph_check)
