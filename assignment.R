library(ggplot2)
library(tidyverse)
library(dplyr)
library(plotly)
setwd("D:/Rprogramming/Assignment")
train<-read.csv("train.csv")
names(train)

train$season <- factor(format(train$season, format="%A"),
                       levels = c("1", "2","3","4") ,
                       labels = c("Spring","Summer","Fall","Winter"))

train$workingday <- factor(format(train$workingday, format="%A"),
                           levels = c("0", "1") ,
                           labels = c("Working Day","Holiday"))

train$weather <- factor(format(train$weather, format="%A"),
                        levels = c("1", "2","3","4") , 
                        labels = c("Good:Clear/Sunny","Moderate:Cloudy/Mist","Bad: Rain/Snow/Fog","Worse: Heavy Rain/Snow/Fog"))


#point
ggplot(train,aes(season,count))+ geom_point()

#bar
ggplot(train,aes(atemp))+geom_bar()

#bar
ggplot(train,aes(x=windspeed)) + geom_bar()

# Density
ggplot(train, aes(x=casual))+geom_density()

# Density
ggplot(train, aes(x=registered))+geom_density()

# Boxplot
ggplot(train, aes(x=season,y=count))+
  geom_boxplot()

#histogram
ggplotly(ggplot(train,aes(x=count)) +
           labs(title='Distribution of Total Bike Rental Count')+
           labs(x='Bike Rental Count',y= 'Frequency of Rental')+
           geom_histogram(bins=25,fill="grey",color="black"))

#point
p <- ggplot(train,aes(atemp,count))
p+labs(title="Total Bike Rentals Vs Actual Temperature ")+
  labs(x="actual Temp",y= "Rents")+geom_point()+geom_smooth(method = "lm")

data_train <- train %>%
  separate(datetime, into = c("hourlyDate", "TimeStamp"),sep =" ")
data_train

meanTemp <- data_train %>%
  group_by(weather) %>%
  summarise(Mean=mean(temp,na.rm = T))

#bar
ggplot(data=meanTemp,aes(x=weather,y=Mean))+
  labs(title="Mean temp of weather")+
  labs(x="weather",y= "Mean of temp")+
  geom_bar(stat = "identity",
           fill=c("steelblue2","yellow1","thistle","blue"))

