getwd()

# Files Window - Find preferred folder, Click "More" -> "Set as working directory"
# The resulting code will go to your console (yours will be different):
setwd("~/Butler_projects/Teaching/RX_Courses/IntroToAnalytics/R/Week3/Week2_data(1)/Week2_data")

heart_data <- read.csv("heart.csv")


############ Simple comparisons ############

5 > 3 # 5 is bigger (TRUE)
3 > 5 # 3 is NOT bigger (FALSE)
3 > 3 # 3 is NOT bigger (FALSE)
3 >= 3 # 3 is equal or bigger (TRUE)

2 < 4

# These are errors
5 = 4
5 <- 4  

# These are ok
4 == 4  # TRUE
4 == 5 # FALSE
4 != 5 # TRUE

# Some can be used for characters
"cat" == "cat"
"cat" != "dog"

# Some should not
"cat" > "dog"  # don't do this
"cat" > "&"


# Usually we'll use variables
x <- 10*4
x > 30


# Using %in%
# Is the thing on the left IN the thing on the right?
nums <- c(2,5,10)
7 %in% nums
5 %in% nums

hair <- c("brown", "black")
"red" %in% hair


############ Putting comparisons together ############
# & - Are both true?
TRUE & TRUE # TRUE
TRUE & FALSE # FALSE

# Is x between 30 & 40
x <- 50
x > 30 & x < 40

# Take patients older than 30 with brown hair
age <- 25
hair <- "brown"
age > 30 & hair == "brown"

# | - Is one true?
TRUE | TRUE  # TRUE
TRUE | FALSE  # TRUE
FALSE | FALSE  # FALSE

# Is x outside of 30-40
x <- 50 
x < 30 | x > 40  # Same as below


# ! - flip the result
x <- 50
!(x > 30 & x < 40)  # Same as above


# Can work with more than 2
bp <- 100
age <- 50
age > 30 & hair == "brown" & bp < 130  # this is fine
age > 30 | hair == "brown" | bp < 130  # this is fine

3 > 5 & 4 < 6 | 5 >3  # This is confusing, we should use parentheses
FALSE & TRUE | TRUE

(3 > 5 & 4 < 6) | 5 >3  # This one is TRUE
FALSE           | TRUE

3 > 5 & ( 4 < 6 | 5 >3 )  # This one is FALSE
FALSE & TRUE


############ Comparisons with vectors and data frames ############

vec <- c(22, 100, 3.1, 55, 60)
vec > 50

sum(vec > 50)
# Fraction of TRUE
mean(vec > 50)  #  3 TRUE / 5 total = 0.6

new_vec <- vec[vec > 50]
new_vec
# Order is conserved


table(heart_data$sex)
head(heart_data)

heart_males <- heart_data[heart_data$sex == "Male",]
head(heart_males)
table(heart_males$sex)

heart_young <- heart_data[heart_data$age < 40,]
max(heart_young$age)


# Use %in% to get certain groups
table(heart_data$chest_pain)
heart_pain <- heart_data[heart_data$chest_pain %in% c("asymptomatic", "typical"),]
table(heart_pain$chest_pain)

# sum & mean work the same as with vectors
sum(heart_data$age > 50)
mean(heart_data$age > 50)

# This also works (counts TRUE and FALSE)
table(heart_data$age > 50)


# You can compare values in two columns
#### Example data (don't worry about the details)
heart_data$rest_bp_after <- rnorm(nrow(heart_data), mean = 120, sd = 20)
head(heart_data) # now we also have a 'rest_bp_after' column

# How many patients have higher blood pressure than before?
mean(heart_data$rest_bp_after > heart_data$rest_bp) 


########### In-class exercise ########### 
#Make a data frame that only contains patients with high cholesterol (240 or higher). How many of these patients are there?
high_chol <- heart_data[heart_data$chol >= 240,]
sum(heart_data$chol >= 240)
dim(high_chol) # or nrow()

# How many of the High-cholesterol patients have heart disease?
sum(high_chol$disease == 1)

#  How many of the other patients (cholesterol below 240) have heart disease?
sum(heart_data$disease == 1 & heart_data$chol < 240)

#  How does the proportion (Fraction, percent) of patients with heart disease from the first group compare with that of the second group?
mean(high_chol$disease == 1)
low_chol <- heart_data[heart_data$chol < 240,]
mean(low_chol$disease == 1)


############ if statements ############
chol <- 220
if (chol >= 240) {
  print("You have high cholesterol!!!")
}

if (chol >= 240) {
  print("You have high cholesterol!!!")
} else {
  print("Lookin good!")
}

# To be continued....

