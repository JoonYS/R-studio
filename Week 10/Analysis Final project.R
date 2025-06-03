# pg 565
# saveRDS(dat, "filename.rd")
# dat <- readRDS("filename.rds")
# tolower() toupper()
# How does consumption of alcohol affect mental health?

saveRDS(new_data, "New2019.rds")

new_data <- PUF2019_100920[, tolower(substr(colnames(PUF2019_100920), 1, 3)) %in% c("cas", "cam", "dst", "sui", "imp", "sex")]
View(new_data)
new_data2 <- new_data[,-c("camelanom", "camoutthro", "caskinoth", "caskindk")]
new_data3 <- new_data[,-c(1,2,3,4,19,23,25,27,29,35,36,37,38)]
new_data3 <- new_dat[,-c(1,2,3,4,12,13,14,15,16,17,21,23,25,27,29,31,33,41,42)]
?substring
getwd()
head(new_data)
new_dat <- PUF2019_100920[, tolower(substr(colnames(PUF2019_100920), 1, 3)) %in% c("cas", "cam", "dst", "sui", "imp", "sex", "new")]
boxplot(casuprob ~ NEWRACE2, data= new_data3)
boxplot(casuprob ~ sexrace, data= new_data3)

ggplot(new_data3, aes(x= casuprob, y= DSTNGD30, colour= NEWRACE2))+
  geom_histogram(binwidth=5)

class(new_data3)

# casuprob= think ever had a problem with own drug/alc use
# DSTNGD30= how often felt down/no good past 30 days
ggplot(new_data3, aes(x= casuprob, y= DSTNGD30, colour= NEWRACE2))+
  geom_point()+ xlim(0,2)+ ylim(0,5)

barplot(new_data3$dstworst)
?barplot
new_data4 <- new_data3[new_data3$dstworst %in% c(1,2),]
new_data4$dstworst <- as.factor(new_data4$dstworst)
levels(new_data4$dstworst) <- c("Yes", "No")
ggplot(new_data4, aes(x=dstworst, fill= dstworst))+
  geom_bar(color="black")+xlab("Felt Depressed in Past 30 days") + ylab("Number of People") + theme_light() + guides(fill="none")
#dstworst= Felt depressed within the past 30 days

new_data4 <- new_data4[new_data4$DSTNRV30 %in% c(1,2,3,4,5),]
new_data4$DSTNRV30 <- as.factor(new_data4$DSTNRV30)
levels(new_data4$DSTNRV30)<- c("All of the Time", "Most of the Time", "Some of the Time", "A Little of the Time", "None of the Time")
levels(new_data4$DSTNRV30)
ggplot(new_data4, aes(x=DSTNRV30, fill=DSTNRV30))+
  geom_bar(color= "black")+xlab("How Often Felt Nervous in Past 30 Days") + ylab("Number of People") + guides(fill="none")

new_data4 <- new_data4[new_data4$suicthnk %in% c(1,2,99),]
new_data4$suicthnk <- as.factor(new_data4$suicthnk)
levels(new_data4$suicthnk) <- c("Yes", "No", "N/A")

ggplot(new_data4, aes(x=suicthnk, fill= NEWRACE2))+
  geom_bar() + xlab("Had Suicidal Thoughts Within Past 12 Months") + ylab("Number of People") +
  facet_wrap(~NEWRACE2)+ guides(fill="none")
#suicthnk= had suicidal thoughts

new_data4 <- new_data3[new_data3$NEWRACE2 %in% c(1,2,3,4,5,6,7),]
new_data4$NEWRACE2 <- as.factor(new_data4$NEWRACE2)
levels(new_data4$NEWRACE2) <- c("White", "Black", "Native American", "Native HI", "Asian", "Mult", "Hispanic")
ggplot(new_data4, aes(x=NEWRACE2, fill= NEWRACE2))+
  geom_bar(color="black")+ xlab("Race") + ylab("Number of People")+ guides(fill="none")
#demographic of race survey

ggplot(new_data3, aes(x=impconcn)) +
  geom_bar() +xlab ("Difficulty Concentrating") + ylab("Number of People") + xlim(0,3)
#impconcn= difficulty concentration

new_data4 <- new_data4[new_data4$casuprob %in% c(1,2,99),]
new_data4$casuprob <- as.factor(new_data4$casuprob)
levels(new_data4$casuprob) <- c("Yes", "No", "N/A")
ggplot(new_data4, aes(x=casuprob, fill= NEWRACE2)) +
  geom_bar()+ xlab("Had a Problem with Drug or Alcohol Use") + ylab("Number of People") +
  facet_wrap(~NEWRACE2)+ guides(fill="none")

#casuprob= problem with alc/drug

newrace2_labs <- c("White", "Black", "NativeAm", "NativeHI", "Asian", "MoreThan1", "Hispanic")
new_data4 <- new_data3
new_data4$NEWRACE2 <- as.factor(new_data4$NEWRACE2)

# Data uses umbrella term of mental health with no real diagnoses other than feelings

new_data5 <- new_data4[new_data4$dstworst %in% c(1,2),]
new_data5 <- new_data5[new_data5$casuprob %in% c(1,2),]
new_data5$dstworst <- as.factor(new_data5$dstworst)
levels(new_data5$dstworst) <- c("Yes", "No")
ggplot(new_data4, aes(x=dstworst, fill= dstworst))+
  geom_bar(color="black")+xlab("Felt Depressed in Past 30 days") + ylab("Number of People") + theme_light() + guides(fill="none") + facet_wrap(~NEWRACE2)
#dstworst= Felt depressed within the past 30 days
table(new_data5$casuprob,new_data5$dstworst)
fisher.test(new_data5$casuprob,new_data5$dstworst)

new_data4 <- new_data4[new_data4$casuprob %in% c(1,2),]
table(new_data4$casuprob,new_data4$NEWRACE2)

chisq.test(new_data4$casuprob,new_data4$NEWRACE2)

new_data4 <- new_data4[new_data4$suicthnk %in% c(1,2),]
table(new_data4$suicthnk,new_data4$NEWRACE2)
chisq.test(new_data4$suicthnk,new_data4$NEWRACE2)
