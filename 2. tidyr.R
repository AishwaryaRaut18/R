#install.packages("tidyverse")
library(tidyverse)

#####Gather
#####Note that "1999" and "2000" are non-syntactic names so need to surround them in backticks
table4a

table4a %>% gather(`1999`, `2000`, key= "year",
                   value= "cases")
# OR
table4a %>% gather(-country, key= "year",
                   value= "cases")
table4a %>%
  pivot_longer(-country,names_to = "year",values_to = "cases")

table4b %>% gather(`1999`, `2000`, key= "year",
                   value= "population")
#OR
table4b %>% gather(-country, key= "year",
                   value= "population")


table4a
######Combined tidied versions using Join

tidy4a <- table4a %>%
  gather(`1999`, `2000`, key= "year", value= "cases")

tidy4b <- table4b %>%
  gather(`1999`, `2000`, key= "year", value= "population")

inner_join(tidy4a, tidy4b,by=c("country","year"))

######Spreading

table2

spread(table2, key = "type", value = "count")

# OR
table2 %>% spread(key = "type", value = "count")

######Separate
table3

table3 %>%
  separate(rate, into = c("cases", "population"),
           sep ="/")

table3 %>%
  separate(rate, into = c("cases", "population"))

table3 %>%
  separate(rate, into = c("cases", "population"),
           remove = F)

table3 %>%
  separate(rate, into = c("cases", "population"),
           sep ="/", convert = TRUE)

table3 %>%
  separate(rate, into = c("cases", "population"),
           convert = TRUE)


######Separate using integers to sep
####
table3 %>%
  separate(year, into = c("century", "year"), sep = 2)

table3 %>% separate(year,
                    into = c("century", "year"), sep =3)

table3 %>% separate(year,
                    into = c("century", "tens", "units"),
                    sep = c(2,3))
######Unite
####

table5
table5 %>% unite(new,century, year, sep = "" )

table5 %>% unite(new,century, year)

###Missing Values

stocks <- tibble(
  year = c(2015,2015,2015,2015,2016,2016,2016),
  qtr = c(1,2,3,4,2,3,4),
  return = c(1.88, 0.59, 0.35, NA, 0.92, 0.17, 2.66)
)

stocks


##drop_na
stocks %>%  drop_na()

##complete

stocks %>% complete(year,qtr)

# Imputing by Mean
mu_return <- mean(stocks$return,na.rm = T)
stocks %>% complete(year,qtr,
                    fill = list(return=mu_return))

##Fill

TVrate <- tribble(~Channel, ~Program, ~Adrate,
                     "SAB TV", "Tarak Mehta", 600,
                     NA, "Chidiya Ghar", 450,
                     NA, "FIR", 250,
                     "Star Plus", "Chandra", 750,
                     NA, "Namkaran", 550)

TVrate %>% fill(Channel)

stocks %>%
  complete(year,qtr) %>%
  fill(return)

stocks %>%
  complete(year,qtr) %>%
  fill(return,.direction = "up")
