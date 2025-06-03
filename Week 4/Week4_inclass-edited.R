# if/else if / else

# High 240 or more, borderline is 200-239

chol <- 250

# Doesn't work!
if (chol >= 200) {
    print("Borderline high cholesterol!")  # 1st TRUE statement
} else if (chol >= 240) {
    print("High cholesterol!!!")
} else {
    print("Normal")
}

# This one works
chol <- 220
if (chol >= 240) {
    print("High cholesterol!") 
} else if (chol >= 200) {
    print("Borderline high cholesterol!!!")
} else {
    print("Normal")
}

# This also works!
chol <- 250
if (chol >= 200 & chol < 240) {
    print("Borderline high cholesterol!") 
} else if (chol >= 240) {
    print("High cholesterol!!!")
} else {
    print("Normal")
}



# if statements can also be used for calculations, checking data.
x <- 100
sqrt(x)

if (x >= 0) {
    print(sqrt(x))
} else {
    print("Error: x should be positive")
}


# Other examples: Interactive apps, checking if data frame has enough rows (or any rows),
# checking if data has proper format



### for loops
for (i in 1:3) {
    print(i)
}

# 'i' is commonly used, but it could be anything.
# The vector could also be any vector.
for (money in c(5, 2, 10, 12)) {
    print(money)
}

for (word in c("apple", "banana", "cat")) {
    print(word)
}

# You don't even need to use the variable inside the loop
# if you just want to repeat something.
for (i in 1:10) {
    print("Hi!")
}


# Usually we'll do some calculation or set of calculations.
for (i in 1:10) {
    print(i^2)
}

## **Extra example** A series of calculations in a loop
for (i in 1:10) {
    answer <- i^2
    another <- answer + 1
    print(another)
}

# An if statement in a loop
for (i in 1:10) {
    if (i > 5) {
        print(i)
    }
}


# In-class Exercise 

5 %% 2  # Gives you the remainder of 5 divided by 2

for (i in 1:20) {
    if (i %% 2 == 0) {
        print(i^2)
    }
}

# seq gives you a vector of numbers in a sequence
even_nums <- seq(from = 2, to = 20, by = 2)
for (i in even_nums) {
    print(i ^ 2)
}


# Using a for loop with a data frame
# NOTE: For this example (or HW), we need to change the command to 'read.csv', not 'read_csv'
# Generally (and for exam), you don't need to worry about the difference.
heart <- read.csv("Butler_projects/Teaching/RX_Courses/IntroToAnalytics/R/data/Week2_data/heart.csv")
ncol(heart)  # number of columns in dataset

for (i in 1:ncol(heart)) {
    print(class(heart[,i]))
}



### while loop

j <- 1
while (j <= 3 ) {
    print(j)
}
# Infinite loop!
# 'Stop' sign or ESC key to stop


j <- 1
while (j <= 3 ) {
    print(j)
    j <- j + 1
}

# A while loop is more flexible.
j <- 1
while (j <= 30 ) {
    print(j)
    j <- j + 5
}

j <- 1
while (j ^ 2 <= 30 ) {
    print(j)
    print(j^2)
    j <- j + 1
}


# Using a while loop in an interactive app
# (don't need to memorize these commands)
your_name <- readline(prompt = "What's your name? ")
print(paste("Hi", your_name))

your_name <- ""
while (your_name == "") {
    your_name <- readline(prompt = "What's your name? ")
}
print(paste("Hi", your_name))


# while loops are more flexible, and can be more complicated
# Good to be able to understand how the computer sees this code, line-by-line:

j <- 1
while (j <= 10) {
    if (j == 4) {
        j <- j*2
    } else if (j >= 8) {
        print("Ha!")
    }
    
    print(j)
    j <- j+1
}


# Is the number prime?  This example was a bit tough...
# How do we check if a number is divisible by another number?
num <- 100
j <- 5
num %% j # --> num is divisble by 5 --> not prime

num <- 72
j <- 5
num %% j # --> num is not divisible by 5 --> prime???
# Need to check other values of 'j'
