library(dplyr)
library(tidyverse)
library(tibble)
setwd("D:/Rprogramming/Datasets")
df <- read.csv("D:/Rprogramming/Datasets/survey.csv")
tibble.survey <- as_tibble(df)
male.non.smokers<-filter(tibble.survey,Sex=="Male",Smoke =="Never")
view(male.non.smokers)
PulseGT80<-filter(tibble.survey,Pulse>80)
PulseGT80 %>% select("Sex","Exer","Smoke","Pulse")

RtHand <- tibble.survey %>%
  mutate(Ratio_Hnd=Wr.Hnd / NW.Hnd) %>%
  select(Ratio_Hnd, Clap, Age) 

DescStats <- summarize(tibble.survey,mean_age=mean(Age,na.rm = T),median_Age=median(Age,na.rm = T),sd_Age=sd(Age,na.rm = T),
                       mean_hght=mean(Height,na.rm = T),median_hght=median(Height,na.rm = T),sd_hght=sd(Height,na.rm = T))


grpclap <- group_by(tibble.survey,Sex,Clap)
DescGrp <- summarize(grpclap,mean_age=mean(Age,na.rm = T),median_Age=median(Age,na.rm = T),sd_Age=sd(Age,na.rm = T),
                     mean_hght=mean(Height,na.rm = T),median_hght=median(Height,na.rm = T),sd_hght=sd(Height,na.rm = T))


courses<-read.csv("Courses.csv")
courseSchedule<-read.csv("CourseSchedule.csv")
O<-merge(x = courses, y = courseSchedule, by.x = "CourseID", by.y = "CourseCode") 

comb <- read.csv("comb1.csv")
combgth <- gather(comb,"Highlighter","Marker","Pen","Refill",key = "ItemType",value = "qty")
glimpse(combgth)

comb1 <- read.csv("comb2.csv")
dt_comb1 <- comb1 %>% separate(PatientID,into = c("ProjecId","SiteId","Patientnumber"),convert = T)
glimpse(dt_comb1)
