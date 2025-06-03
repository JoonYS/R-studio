# Scripts are useful for saving your work
# This # makes a "comment"
# comments are not really code, but they describe your work

# We can use R as a calculator +-*/^

5 + 3 #CTRL-ENTER to run a line

5+3
6/3
6 * 3
6^2

# Remember our order of operations
6 * 3 + 2
2 + 3 * 6
(2 + 3) * 6

# Assign the result of something to a variable and save for later
x <- 5+3
x
word <- "moo"
word

# Print the answer
x
print (x)

y <- x * 5
y

# Setup a vector of numbers (more next week)
simpleVector <- c(5, 7, 6)

# calculate the average
(5 + 7 + 6)/ 3

# functions make things easier
mean (simpleVector)

# This gives information about specific functions
help(mean)
?mean
  
# copy example from help
x <- c(0:10, 50)
xm <- mean(x)

# Need a little more help?
??scatterplot
  
#most help? google
#simpleVector <- c(5,7,6)
anotherVector <- c(3,2,1)

plot(simpleVector,anotherVector)



# How do find the highest value in vector
vec3 <- c(25,4,3,57,12)
max(vec3)



# Run the whole file using "Source" button


# Swirl for extral practice (optional)
install.packages("swirl") # you only need to do once
library(swirl) # you need to use every "session"
swirl()

