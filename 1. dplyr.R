library(tidyverse)

# library(dplyr)
# library(MASS)
# data("Cars93")
Cars93 <- read.csv("F:/R Course/Datasets/Cars93.csv")
tbl_Cars <- as_tibble(Cars93)


class(tbl_Cars)
str(tbl_Cars)

###Equivalently tibble####
library(tibble)
glimpse(tbl_Cars)

#### Arranging the rows ####
ord_Model <- arrange(tbl_Cars , Model)
arrange(tbl_Cars, Price)
arrange(tbl_Cars, desc(Price))
###Arranging by multiple columns ####

ord_mnf_mdl <- arrange(tbl_Cars,Manufacturer,Model)

ord_mnf_mdl <- arrange(tbl_Cars,Manufacturer,desc(Model))

arrange(tbl_Cars, Manufacturer, Price)
arrange(tbl_Cars, Manufacturer, desc(Price))
## select <- dplyr::select
## In case if your function call is
#  prioritized to another package

#### Choosing the columns #####

select(tbl_Cars,1:3)
select(tbl_Cars,-(1:7))
select(tbl_Cars,Model:Max.Price)
select(tbl_Cars, ends_with("Price"))
select(tbl_Cars, starts_with("MPG"))
select(tbl_Cars, contains("in"))
select(tbl_Cars, contains("se"))

#### Filtering the data #####
filter(tbl_Cars, Type=="Small")
filter(tbl_Cars, Type=="Small" & Max.Price<10)
filter(tbl_Cars, Type=="Small" | Max.Price<10)
filter(tbl_Cars, Manufacturer %in% c("Acura","Audi"))
filter(tbl_Cars, Type %in% c("Small","Midsize"))

#### Renaming the columns #####
rename(tbl_Cars,Minimum=Min.Price,Maximum=Max.Price)

#### Adding new column(s) #####

tbl_Cars_rng <- mutate(tbl_Cars,
                       Price_Range = Max.Price - Min.Price,
                             ratio = Weight/Passengers)

select(tbl_Cars_rng,Model,Price_Range,ratio)

#### Summarizing ####

summarize(tbl_Cars, avg_Price = mean(Price,na.rm = TRUE),
          sd_Price = sd(Price,na.rm = TRUE))

#### Group by ####
by_Air <- group_by(tbl_Cars, AirBags)
summarize(by_Air, avg_Price = mean(Price,na.rm = TRUE),
          sd_Price = sd(Price,na.rm = TRUE))

# Grouping with multiple columns

by_Air_Origin <- group_by(tbl_Cars, Origin,AirBags)
summarise(by_Air_Origin, avg_Price = mean(Price,na.rm = TRUE),
          sd_Price = sd(Price,na.rm = TRUE))


#### =Counting the grouped observations ####
tally(by_Air)
tally(by_Air_Origin)

#### Multiple Operations with  %>% operator ####
#### Chaining or Pipelining #####

tbl2 <- select(tbl_Cars, Model,Price, Type)
filter(tbl2, Type=="Small" )

##Instead of
filter(select(tbl_Cars, Model,Price, Type), Type=="Small")

## We can type
# magrittr
tbl_Cars %>%
  select(Model,Price, Type) %>%
  filter(Type=="Small")

#Considering
x1 <- 1:5; x2 <- 2:6

##Instead of
sqrt(sum((x1-x2)^2))

## We can type
(x1-x2)^2 %>% sum() %>% sqrt()

## Instead of
by_Air_Origin <- group_by(tbl_Cars, Origin,AirBags)
summarise(by_Air_Origin, avg_Price = mean(Price,na.rm = TRUE),
          sd_Price = sd(Price,na.rm = TRUE))

## We can type
tbl_Cars %>%
  group_by(Origin,AirBags) %>%
  summarise(avg_Price = mean(Price,na.rm = TRUE),
            sd_Price = sd(Price,na.rm = TRUE))


###### Joins ############
setwd("F:\\R Course\\Datasets")
A <- read.csv("A.csv")
B <- read.csv("B.csv")

# Inner Join
AB <- inner_join(A,B,by="IdNum")

# Left Outer Join
AB <- left_join(A,B,by="IdNum")

# Right Outer Join
AB <- right_join(A,B,by="IdNum")

# Full Outer Join
AB <- full_join(A,B,by="IdNum")

#OR

AB <- A %>% full_join(B,by="IdNum")
