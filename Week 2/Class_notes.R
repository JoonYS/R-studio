# Setting variables 

var = 5
var
print (var)

var2 = var+3
var2

# Your computer is runnign all of this in order
i <- 3 
j <- i+5
j



### Data types
# numerics do numeric things
2+2
median(c(3,9,12))
Medain(c("dog", "cat"))
"2"+"2"

# characters do character things
toupper("five")
toupper(5)

paste("hi", "class")
my_name <- "cclass"
paste("hi", my_name)

# Vectors
# Vectors can any number & class of element( must be the same class)
vec1 <- c(35, 12, 100) # means "make a vector"
vec1

vec2<-10
vec3=c("hello", "goodbye")
vec3

# Mix element classes? 
vec4<- c ("words", "3 more words", 12)
vec4


# You can fidn an element of a vectorusing "indexing" (position number)
vec5 <- c("a", "b", "c", "d", "e")
vec5[3] # the third thing
vec5[c(1,3)]
vec5[3:5]

# You can use this to change an element (or multiple)
vec5[3] <-"G"
vec5

vec5[3:5] <- c("J", "H", "I")
vec5


# Data frames
# Rows & Columns, just like excel spreadsheets

basic_df <- data.frame(name = c ("Bob", "Jane", "Tim", "Sue"), 
                       age = c ( 23, 45, 35, 52),
                       location = c ("Vegas", "Indy", "NY", "Boston"))
# Must have the same number of things in each column (same class too)
basic_df

getwd() # get working directory
setwd("Week2/Week2_data")




# More often we load in" data
heart_data <- read.csv("Week2/Week2_data/heart.csv")
# look at first few rows
head(heart_data)

# last few rows
tail(heart_data)

# whole thing
view(heart_data)


 
# Brackets help you get specific data
heart_data[2,4] #[Row, column]

heart_data[1:3, c(2,4)]

heart_data[5, ]

