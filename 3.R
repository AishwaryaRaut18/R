library(lubridate)
library(tidyverse)
library(dplyr)
library(tidyr)
setwd("D:/RProgramming/Datasets")
orders <- as_tibble(read.csv("Orders.csv"))
orders

orders <- orders %>% mutate(Day=day(dmy(Order.Date)),
                            Month=month(dmy(Order.Date)),
                            Year=year(dmy(Order.Date)) )
orders


#Alternative to 1st


orders$Order.Date <- dmy(orders$Order.Date)
orders$Month <- month(orders$Order.Date)
orders$Day <- day(orders$Order.Date)
orders$year <- year(orders$Order.Date)

#2nd one

orders$Order.Date <- as.Date(orders$Order.Date, format = "%d-%b-%y")
orders$After1Year <- orders$Order.Date
year(orders$After1Year)<- year(orders$Order.Date)+1