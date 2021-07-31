library(ggplot2)
library(qplot)
library(tidyverse)
setwd("D:/Rprogramming/Datasets")
collision_data<-read.csv("AutoCollision.csv")

qplot(Severity, Claim_Count , data=collision_data  ,
      main = "Severity by Claim Count",
      xlab = "Severity", ylab = "Claim Count",color=Vehicle_Use)+ theme(plot.title = element_text(hjust=0.5))

ggplot(collision_data, aes(x=Vehicle_Use,y=Claim_Count))+
  geom_boxplot(fill=c("red","green","blue","purple"))+labs(title = "Claims Count by Vehicle Type")+ labs(x="Vehicle Type", y="Claim Count")


Ornstein<-read.csv("Ornstein.csv")

ggplot(Ornstein, aes(fill=sector,nation)) +
  labs(title= "Firms by Nation Across sectors")+
  labs(x="Nation",y="Count")+ 
  geom_bar(position="stack")+theme(plot.title=element_text(hjust = 0.5))

ggplot(Ornstein, aes(x=assets, y=interlocks,color=sector))+
  geom_point()+
    facet_grid(.~sector)

data(mtcars)
ggplot(mtcars,aes(disp,mpg,color=gear))+
  geom_point()

