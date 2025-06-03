# These first ones are 'base' plotting functions,
# which don't require us to call any library()

### Barplots
precip # example data set
length(precip)
?precip

barplot(precip)  # too many, confusing to look at

example_data <- head(precip)
barplot(example_data)

# Make it clearer with an axis label
barplot(example_data, ylab = "Annual precipitation (in)")

# Other options (optional in this case)
barplot(example_data, ylab = "Annual precipitation (in)",
        xlab = "City", main = "Precipitation in US Cities")  

### Histogram
precip

summary(precip)  # Looking at the distribution with numbers
hist(precip)    # Looking at the distribution visually
hist(precip, breaks = 20)   # Can experiment with number of 'breaks'

# Same label options as before
hist(precip, breaks = 20, xlab = "Annual precipitation (in)",
     ylab = "Number of cities", main = "Histogram of precipitation")


### Scatterplots
head(iris)  # another example data set
table(iris$Species)

plot(x = iris$Petal.Length, y = iris$Petal.Width)
plot(iris$Sepal.Length, iris$Sepal.Width)

plot(iris$Sepal.Length, iris$Sepal.Width,
     xlab = "Length", ylab = "Width", main = "Sepal Measurements")
plot(iris$Sepal.Length, iris$Sepal.Width, col = iris$Species,
     xlab = "Length", ylab = "Width", main = "Sepal Measurements")
# Not easy to add a legend in 'base' plotting,
# ggplot2 is better


### Pairs plot
pairs(iris)
# This turns 'Species' into numeric, can be somewhat useful

pairs(iris[,-5])  # keep all rows, remove column 5
pairs(iris[,1:4]) # another way to do the same thing


### Line plots
# Bad use of a line plot:
plot(iris$Sepal.Length, iris$Sepal.Width, type = "l",
     xlab = "Length", ylab = "Width", main = "Sepal Measurements")


?ldeaths
ldeaths
class(ldeaths) # "time series" (N.I.)

# It makes sense to connect the dots in this case:
plot(ldeaths, type = "l")

# You could also use 2 columns of a data frame to make this type of plot


### Boxplots
head(iris)

# Compare distribution of Sepal Lengths for each species
boxplot(Sepal.Length ~ Species, data = iris)
# -> Virginica longest, Setosa shortest


# Activity

heart <- read.csv("R/Week6/Week6_data/Week6_data/heart.csv")
head(heart)

hist(heart$chol, breaks = 20)

boxplot(max_hr ~ disease, data = heart)
# Could use as.factor(),  levels() to make 
# names for disease instead of 0/1  (optional)


### ggplot2
library(ggplot2)

# First we tell ggplot what data frame to use
# Then we add the columns to use inside the aes() function
ggplot(iris, aes(x = Petal.Length, y = Petal.Width))
# -> no geom, no plot

# Scatter plot
ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point()

# Scatter plot, colored by species
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour = Species)) +
  geom_point()

# Separate scatter plot for each species
ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point() +
  facet_wrap(~ Species)
 Petal.Length, y = Petal.Width, colour = Species)) +
  geom_point() +
# Adding axis labels and a theme 
ggplot(iris, aes(x =
  xlab("Length") + ylab("Width") + ggtitle("Iris Petal Measurements") +
  theme_classic() # you can google all of the options and pick one you like

# Add a 'smooth' line
ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point() +
  geom_smooth()

# Using a linear model instead (straight line)
ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point() +
  geom_smooth(method = "lm")

?geom_smooth



### Boxplot
ggplot(iris, aes(x = Species, y = Sepal.Length)) +
  geom_boxplot() +
  xlab("") + ylab("Length")

# a little color (same for all boxes)
ggplot(iris, aes(x = Species, y = Sepal.Length)) +
  geom_boxplot(fill = "pink") +  
  xlab("") + ylab("Length")

# Use species for color -> needs to be in aes()
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  xlab("") + ylab("Length") + guides(fill="none") # no legend for "fill"



### Activity 

head(heart)

ggplot(heart, aes(x = age, y = max_hr, colour = disease)) +
  geom_point() +
  facet_wrap(~ disease)

# Linear fit (all together)
ggplot(heart, aes(x = age, y = max_hr)) +
  geom_point() +
  geom_smooth(method = "lm")



# Better to change disease to factor
# This is also required to do 2 lines in the same plot 
heart$disease <- as.factor(heart$disease)
levels(heart$disease) <- c("Control", "Disease")

ggplot(heart, aes(x = age, y = max_hr, colour = disease)) +
  geom_point() +
  geom_smooth(method = "lm") 


# Linear fit (separate plots)
# This one is probably the clearest to understand
ggplot(heart, aes(x = age, y = max_hr)) +
  geom_point() +
  geom_smooth(method = "lm") +
  facet_wrap(~ disease)
# --> Max HR decreases with age for control patients, 
# but for patients with heart disease, it's always pretty low.



# Bonus example--
### Concentration-Time Curve
pk_dat <- read.csv("PK_fromPharmPress.csv")
head(pk_dat)

ggplot(pk_dat, aes(x = Time, y = C2)) +
  geom_line()

# Change scale -> we can see the logarithmic decay
ggplot(pk_dat, aes(x = Time, y = C2)) +
  geom_line() +
  scale_y_log10()
