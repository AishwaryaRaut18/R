library(tidyverse)
library(dplyr)
setwd("D:/Rprogramming/Datasets")
df<-read.csv("D:/Rprogramming/Datasets/Orders.csv")
online<-subset(df,Payment.Terms=="Online")

a<-mtcars
write.csv(a,"D:/Rprogramming/ass1.csv")

diamond<-read.csv("D:/Rprogramming/Datasets/Diamonds.csv",header = TRUE,sep=";")
sub.diamond<-subset(diamond,cut=="Premium" & color =="J")

diamonds<-diamond[FALSE, ]

tibble.mtcars<-as_tibble(a)
tibble.mtcars %>% slice(2:2,18:18,30:30,12:12)