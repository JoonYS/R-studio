library(ggplot2) #for later

#These first ones are 'base' plotting functions.

### Barplots
precip
length(precip)
?precip

barplot(precip)

example_data = head(precip)
head(example_data)
barplot(example_data)

barplot(example_data, ylab = "Annual precipitation (in)",
  xlab = "city", main = "precipitaion in US citites")

### Historgram
precip
summary(precip)
hist(precip)
hist(precip, breaks = 20)


hist(precip, breaks = 20, xlab = "Annual precipitaiton (in)", 
     ylab= "number of cities", main = "histogram of precipitation")

### scatterplots
head(iris)
table(iris$Species)

plot(x= iris$Petal.Length, y = iris$Petal.Width)
plot(iris$Sepal.Length, iris$Sepal.Width,
     xlab = "length", ylab= "width", main = "sepal measurements")

plot(iris$Sepal.Length, iris$Sepal.Width, col = iris$Species,
     xlab = "length", ylab= "width", main = "sepal measurements")


# Not easy to add a legend in 'base' plotting


# Pairs plot
pairs(iris)
pairs(iris[,-5]) # Removed column 5

### Line plots
plot(x= iris$Petal.Length, y = iris$Petal.Width)
plot(iris$Sepal.Length, iris$Sepal.Width, type = "l",
     xlab = "length", ylab= "width", main = "sepal measurements")

#bad
?ldeaths
ldeaths
class(ldeaths) # "timer sereies" (N.I.)
plot(ldeaths, type = "l")

### Box plots
head(iris)

boxplot(Sepal.Length ~ Species, data = iris) 

### Adding heart data
heart = read.csv("Home/Week6/Week6_data/heart.csv")
summary(heart)

hist(heart$chol)

boxplot(max_hr ~ disease, data = heart)

# as.factor to change 0 and 1 to a name = levels()

### ggplot2
library(ggplot2)

ggplot(iris, aes(x=Petal.Length, y = Petal.Width, colour= Species))+ geom_point()+
  xlab("length")+ylab("width")+ggtitle("iris petal measurements")+theme_void()

## Seperates the "Speicies"

ggplot(iris, aes(x=Petal.Length, y = Petal.Width, colour= Species))+ geom_point()+
  facet_wrap(~Species)

ggplot(iris, aes(x=Petal.Length, y = Petal.Width, colour= Species))+ geom_point()+
  xlab("length")+ylab("width")+ggtitle("iris petal measurements")+theme_void()+ geom_smooth(method = "lm")

?geom_smooth


#Boxplot
ggplot(iris, aes(x = Species, y = Sepal.Length))+
  geom_boxplot() +
  xlab("")+ ylab("length")

# a little color
ggplot(iris, aes(x = Species, y = Sepal.Length))+
  geom_boxplot(fill  = "pink") +
  xlab("")+ ylab("length")
 
# Use speices for color = need to be inside the aes()
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species))+
  geom_boxplot() +
  xlab("")+ ylab("length")+ guides(fill = "none") # no legend for "fill"


ggplot(heart, aes(x = max_hr, y = age, colour = disease))+geom_point()+ geom_smooth(method="lm")+
  xlab("HeartRate")+ ylab("Age")+ ggtitle("Heartdisease from Heartrate and age") +facet_wrap(~disease)+ theme_gray()
