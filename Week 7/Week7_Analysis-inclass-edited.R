### t test

?t.test

# Example data set (built-in R data)
head(sleep)
?sleep

boxplot(extra ~ group, data = sleep)

# two ways to do a t.test
group1 <- sleep$extra[sleep$group == 1]
group1
group2 <- sleep$extra[sleep$group == 2]
group2

# t.test using 2 vectors
t.test(group1, group2)
# p = 0.08 -> we would not reject the "null hypothesis"
# not strong enough evidence that the difference is not due to random chance

sleep # All 10 patients were given both drugs
t.test(group1, group2, paired = TRUE)
# Paired test - groups need to be in same order

# t.test using a formula (similar to boxplot function)
# This one also works for unpaired test
t.test(extra ~ group, data = sleep, paired = TRUE)



### ANOVA
head(iris)

boxplot(Sepal.Width ~ Species, data = iris)

?aov

resANOVA <- aov(Sepal.Width ~ Species, data = iris)
summary(resANOVA)
# p << 0.05 - strong differences in width in at least 1 of the groups
# don't know which one exactly based on p-value


### Activity

cryotherapy <- read.csv("R/Week7/Week7_data/Week7_data/Cryotherapy.csv")
head(cryotherapy)

table(cryotherapy$sex)

t.test(Area ~ sex, data = cryotherapy)
# p 0.4 > 0.05 -> not stat. significant

table(cryotherapy$Type)
summary(aov(Area ~ Type, data = cryotherapy))


### Fisher's exact test
?fisher.test

# Make a 2x2 matrix
CancerStudy <- matrix(c(2, 1, 2, 4),
                      nrow = 2,
                      dimnames = list(Group = c("Smoker", "NonSmoker"),
                                      Disease = c("Cancer", "Healthy")))
CancerStudy

fisher.test(CancerStudy)
# p = 0.52 -> not a significant difference

heart_data <- read.csv("R/Week7/Week7_Data/Week7_data/heart.csv")
head(heart_data)

# Usually, we're comparing 2 categorical columns of a data frame
# Does exercise-induced angina correlate with heart disease?

table(heart_data$disease)
# Cross-tab
table(heart_data$exang, heart_data$disease)
# Easier to understand this way:
table(ExAng=heart_data$exang, Disease=heart_data$disease)

fisher.test(heart_data$exang, heart_data$disease)
# p << 0.05 - suggests strong correlation between angina and disease


# Related: Chi-Squared Test
table(heart_data$chest_pain, heart_data$disease)
chisq.test(heart_data$chest_pain, heart_data$disease)
# p << 0.05
# Table shows that asymptomatic has highest rate



### Correlation
head(iris)

plot(iris$Petal.Length, iris$Petal.Width)
cor(iris$Petal.Length, iris$Petal.Width)

plot(iris$Sepal.Length, iris$Sepal.Width)
cor(iris$Sepal.Length, iris$Sepal.Width)


cor(iris[,-5])
pairs(iris[,-5])

library(pheatmap)
pheatmap(cor(iris[,-5])) # Useful for bigger data sets



### Linear Regression

plot(iris$Petal.Length, iris$Petal.Width)

iris_model <- lm(Petal.Width ~ Petal.Length, data = iris)
summary(iris_model) 
# Interpretation of the summary:
# Very small p-value for length --> length can be used to predict width
# "Estimates" provide slope and intercept:
# Width = -0.36 + 0.42 * Length


### Logistic regression - Is this versicolor?
head(iris)
iris$versicolor <- iris$Species == "versicolor"
head(iris)

# Can we predict if a flower is versicolor based on Sepal.Length
iris_model2 <- glm(versicolor ~ Sepal.Length, data = iris)
summary(iris_model2)
# p = 0.33 -> not statistically significant
# --> No, we can't make a confident prediction based on Sepal.Length

# Can we predict versicolor based on all lengths and widths?
iris_model3 <- glm(versicolor ~ Sepal.Length + Sepal.Width +
                     Petal.Length + Petal.Width, data = iris)
summary(iris_model3)
# Interpretation:
# Sepal.Length has no significant relation with versicolor
# Sepal.Width has strong relation with versicolor (p = 0.0001)
#   Negative Estimate -> Shorter width more likely to be versicolor
# Petal.Length has some relation with versicolor (p = 0.04)
#   Positive Estimate -> Longer length more likely to be versicolor
# Petal.Width has strong relation with versicolor (p = 0.006)
#   Negative Estimate -> Shorter petal length more likely to be versicolor


boxplot(Sepal.Width ~ versicolor, data = iris) # clear difference
boxplot(Petal.Length ~ versicolor, data = iris) # more complicated

# "." means to regress versicolor against all other variables
iris_model3 <- glm(versicolor ~ ., data = iris[,-5])


# Health example (hw):
# Based on characteristics, can we estimate risk of developing disease?





