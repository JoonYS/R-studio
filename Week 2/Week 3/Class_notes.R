getwd()
> setwd("~/Week 2/Week2_data")
#IN files - find prefered folder, click "more"-> "set as working directory"
  
  heart_data <- read.csv("heart.csv")
  
  # Simple comparison 
  
  5 > 3 # 5 is bigger (TRUE) 
3 > 5   
# 3 is not bigger (False)  
3 > 3 # 3 is not bigger than 3
3>=3 # 3 is equal or bigger

2>4
 4 ==4
5 <-4 # bad
4 == 4 # good
 4 == 5
4 !=5 

#some can be used for characters
"cat" == "cat"
"cat" != "cat"

"cat" > "dog" # don't do this
"cat" > "$"

# using variables
x <- 10*4
x>30

 
# using %in%
#Is the thing on the left IN the thing on the right?
nums <- c(2,5,10)
7 %in% nums
5 %in% nums

hair <- c("brown","black")

# putting comparison together
# &- are both true?
TRUE & TRUE
TRUE & FALSE

# is x between 30 & 40
x<-50
x>30 & x<40

# Take patients older than 30 with brown hair
age <-35
Hair <-"brown"
age>30 & Hair == "brown"

# |- is one true
 TRUE | TRUE
TRUE | FALSE 
FALSE | FALSE

# IS X OUTSIDE OF 30-40
x < 30 | x >40


# ! - flips the result 
!(x>30 & x<40)
 

# can work with more than 2 
bp <- 100
age <- 50
age > 30 & Hair == "brown" & bp <130
age > 30 | Hair == "brown" | bp <130 # this is fine


3>5 & 4<6 |5>3
FALSE & TRUE | TRUE

(3< 5 & 4<6) |5>3

head(heart_data)

sum(vec >50)
vec <- c(22,100, 3.1, 55,60)
vec >50
 mean(vec >50) # t=1, f=0 3/5 =0.6

 # fraction of TRUE
  
 new_vec <- vec[vec>50]
new_vec 
#order is conserved

table(heart_data$sex)
head(heart_data)

heart_males <- heart_data[heart_data$sex == "Male", ]
head(heart_males)
table(heart_males$sex)

heart_young <-heart_data[heart_data$age <40, ]
max(heart_young$age)
# use %in% to get certain groups
table(heart_data$chest_pain)
heart_pain <-heart_data[heart_data$chest_pain %in% c("asymptomatic", "typical"),]
table(heart_pain$chest_pain)
#sum & mean work the same
sum(heart_data$age >50)
mean(heart_data$age >50)
table(heart_data$age >50)


#you can compare values in two columns
#### Example data (don't worry about the details)
heart_data$rest_bp_after <-rnorm(nrow(heart_data),mean =120, sd = 20)
head(heart_data)

sum(heart_data$rest_bp_after > heart_data$rest_bp)
mean(heart_data$rest_bp_after > heart_data$rest_bp)

#activity
high_chol <- heart_data[heart_data$chol >=240,]
table(high_chol)
sum(heart_data$chol >=240)
sum(high_chol$disease  ==1)



### If statements
chol <- 220
if (chol >= 240){
    print ("you have high cholsetrol!!!")
}

if()