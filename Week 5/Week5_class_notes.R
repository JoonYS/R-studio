install.packages("dplyr")
install.packages("ggplot2")

 mental_health_fakePHI <- read.csv("~/Week 5/Week5_data/mental_health_fakePHI.csv")
   View(mental_health_fakePHI)
 setwd("~/Week 5/Week5_data")
 dat = read.csv("heart_fakePHI.csv")
 head(dat) 

dat = read.csv("heart_fakePHI.csv")



head(dat)
#check for dupilcates
duplicated(c(1,2,3,1,1))
duplicated(dat$MRN)
any(duplicated(dat$MRN)) # related: all () = for all things 


# remove duplicates

dat = dat[!duplicated(dat$MRN),] #keep non-duplicate rows, keep all columns

#REMOVE PHI columns
colnames((dat))

dat <- dat[,-c(1,2,16,20,21)]


# Birthday to age 
dat$birthDate <- as.Date(dat$birthDate, format = "%m/%d/%Y")
head(dat$birthDate)
surveyDate = as.Date("1/1/2020", format = "%m/%d/%Y")


# New column
dat$Age = as.numeric(difftime(surveyDate, dat$birthDate, units= "days")/365)

dat$Age = round(dat$Age)
head(dat$Age)

head(dat)

#remove birthday

dat= dat [,-1]

head(dat)

write.csv(dat, "heart_noPHI.csv", row.names = FALSE, col.names = TRUE)




### DATA cleaning

# quick look at possible issues
str(dat)

View(dat)

dat$rest_bp = as.numeric(dat$rest_bp)
dat$chol = as.numeric(dat$chol)

str(dat)

table(dat$sex)

table(dat$chest_pain) # need correct

#old-fashioned way
dat$chest_pain[dat$chest_pain == "asymptmatic"] = "asymptomatic"
table(dat$chest_pain)
dat$chest_pain[dat$chest_pain == "NT"] = "nontypical"
dat$chest_pain[dat$chest_pain == "typ"] = "typical"


library(dplyr) #recode makes it easier

#check for outliers
summary(dat$rest_bp)
summary(dat)
