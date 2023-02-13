library(tidyverse)
library(readxl)
library(readr)
examscores <- read_csv("C:/Users/atmir/Downloads/examscores - Sheet1.csv")
View(examscores)
colnames(examscores) <- c("Treatment","Student_code","Age_group", "Gender", "Raw_Score")

Age_group <- factor(examscores$Age_group)

ag_1<-subset(examscores, Age_group %in% "1")
ag_1_zscore<-scale(ag_1$Raw_Score)

ag_2<-subset(examscores, Age_group %in% "2")
ag_2_zscore<-scale(ag_2$Raw_Score)

ag_3<-subset(examscores, Age_group %in% "3")
ag_3_zscore<-scale(ag_3$Raw_Score)

ag_4<-subset(examscores, Age_group %in% "4")
ag_4_zscore<-scale(ag_4$Raw_Score)

ag_5<-subset(examscores, Age_group %in% "5")
ag_5_zscore<-scale(ag_5$Raw_Score)

ag_6<-subset(examscores, Age_group %in% "6")
ag_6_zscore<-scale(ag_6$Raw_Score)

ag_7<-subset(examscores, Age_group %in% "7")
ag_7_zscore<-scale(ag_7$Raw_Score)

ag_8<-subset(examscores, Age_group %in% "8")
ag_8_zscore<-scale(ag_8$Raw_Score)

ag_9<-subset(examscores, Age_group %in% "9")
ag_9_zscore<-scale(ag_9$Raw_Score)


zscore<-c(ag_1_zscore, ag_2_zscore,ag_3_zscore, ag_4_zscore,ag_5_zscore, ag_6_zscore,ag_7_zscore, ag_8_zscore,ag_9_zscore)

examscores<-cbind(examscores,zscore)
View(examscores)

average= mean(examscores$Raw_Score)
summary(average)
sd=sd(examscores$Raw_Score)

Score<- (average + examscores$zscore*sd)
summary(Score)

Score<-pmax(Score,0)
summary(Score)

Score<-pmin(Score,40)
summary(Score)

examscores=cbind(examscores, Score)
view(examscores)
