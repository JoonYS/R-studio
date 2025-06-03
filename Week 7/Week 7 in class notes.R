### T test

?t.test

head(sleep)
?sleep

boxplot(extra ~ group, data = sleep)

#two ways to do a t.test
group1 = sleep$extra[sleep$group ==1]
 
group2 = sleep$extra[sleep$group ==2]

t.test(group1, group2)

 #p= 0.08  -> we would not reject the "null hypothesis"
#not strgon enough evidence that the differenece is not due to random chance

sleep

t.test (group1, group2 , paired = TRUE)

t.test(extra ~ group, data = sleep)

t.test(extra ~ group, data = sleep, paired = TRUE)       

###Anova
head(iris)

boxplot(Sepal.Width ~ Species, date = iris)

?aov
resANOVA = aov(Sepal.Width ~ Species, data = iris)
summary(resANOVA)
#p << 0.05 ~ strong differences in width in at lesat 1 of the groups
# dont' know which one exactly based on p- avlue 

t.test(Area ~ sex, data=  Cryotherapy)
#p 0.4 >0.5 = not statistically significant
summary(aov(Area ~ sex, data=  Cryotherapy))


###Fisher's exact test
?fisher.test

# Make a 2 x 2 matrix
CancerStudy = matrix(c(2,1,2,4),
                    nrow = 2,
  dimnames = list(Group = c("smoker", "Nonsmoker"), 
        Disease = c("cancer", "Healthy")))

CancerStudy

fisher.test(CancerStudy)

#p = 0.52 means not a significant different

#usually , we're comparing 2 categorical columns of a data fram
#Does exercise induced angina correlate with heart disease?

table(heart$disease)
# cross-tab
table(heart$exang, heart$disease)
table(ExAng=heart$exang, Disease = heart$disease)
fisher.test(heart$exang, heart$disease)

#p value is very very small <0.5 

#related chi-squared
table(heart$chest_pain, heart$disease)
chisq.test(heart$chest_pain, heart$disease)

# p value is also very small here


iris_model = lm(Petal.Width ~ Petal.Length, data = iris)
summary((iris_model))


###Logistic regression - is this versicolor?
head(iris)

iris$versicolor = iris$Species == "versicolor"
head(iris)
iri_model2 = glm(versicolor~ Sepal.Length, data = iris)

iris_model3 = glm(versicolor ~ Sepal.length + Sepal.Width +
                    Petal.Length + Petal.Width, data = iris)
boxplot(Petal.Width ~ versicolor, data = iris)
