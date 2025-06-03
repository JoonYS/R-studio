#Week 4 class notes 

#if/else if / else

#high > 240, borderline >200

x = -100
sqrt(x)

if(x>=0) {
  print(sqrt(x))
} else { 
  print("Error: x should be positive")
}  


### for loops 
for (i in 1:3) {
  print(i)
}

for (money in c(5, 2, 10, 12)) {
  print(money)
}

for (word in c("apple", "banana", "cat")) {
  print(word)
}


for(i in 1:10) {
  print("hi!")
}

for (i in 1:10) {
    print(i^2)
}
 
for (i in 1:10) {
    if (i>5) {
        print(i)
    }
}



for (i in 1:20) {
  if(i %% 3==1) {
    print(i^2)
}
}

even_num = seq(from =2, to =20, by =2)

for (i in even_num) {
    print (i^2)
}





ncol(heart) # number of columns in data set

for(i in 1:ncol(heart)) {
    print (class(heart[,i]))
}


### while loopsb= runs until condition is false
j = 1
while (j <=3) {
  print(j)
}
# infinite loop!
# 'stop' sign or ESC key to sto


j = 1
while (j<=30) {
    print(j)
    j=j+5
}  



j = 1
while (j^2 <=30) {
  print(j)
  print(j^2)
  j=j+1
}  



your_name = readline(prompt = "what's your name")
print(paste("Hi", your_name))

your_name =""
while(your_name=="") {
    your_name<-readline(prompt = "what'syour name?")
}

printe(paste("Hi", your_name))

j=1
while(j<=10) {
    if(j==4) {
        j=j*2
    } else if (j>= 8) {
        print("Ha!")
    }
  
  print(j)
  j=j+1
}


#activity


num = 100
j = 5
num %% j # = num is not prime






num = 71
j = 5
num %% j