dt1 <- as.Date("2020-05-07") # yyyy-mm-dd
class(dt1)
unclass(dt1)

dt2 <- as.Date("2019-09-17")
class(dt2)
unclass(dt2)

dt1 <- as.Date("1970-01-01")
class(dt1)
unclass(dt1)

dt1 <- as.Date("1970-01-02")
class(dt1)
unclass(dt1)

dt1 <- as.Date("1969-12-31")
unclass(dt1)

dt1 <- as.Date("2018-11-12")
unclass(dt1)
####################################################
dt1_f <- "18-06-2017"  # dd-mm-yyyy
dt_d <- as.Date(dt1_f, format="%d-%m-%Y")
unclass(dt_d)

dt1_f <- "18-Jun-17"  # dd-mon-yy
dt_d <- as.Date(dt1_f, format="%d-%b-%y")
unclass(dt_d)

dt1_fd <- c("18-06-2017","12-09-2012","26-12-2004",
            "23-04-2013")
dt_dd <- as.Date(dt1_fd, format="%d-%m-%Y")

######################################################
Sys.Date()
class(Sys.Date())
Sys.time()
class(Sys.time())

dt2 <- as.Date("2018-02-21")
chdat <- format(dt2, "%d, %B %Y")
class(dt2)
class(chdat)

format(dt2, "%d, %B %Y")
format(dt2, "%d-%b-%Y")
format(dt2, "%A, %d %B %Y")

# Reading the date which is not in format yyyy-mm-dd
dft <- "24, August 2020 09:45:12"
dfy <- strptime(dft,"%d, %B %Y %H:%M:%S")
dfy
class(dfy)


# Reading only date and storing it in Date Object
dft <- "20/10/15"
dfy <- strptime(dft,"%d/%m/%y")
dfy1 <- as.Date(dfy)
class(dfy1)

setwd("F:/R Course (C-DAC)/Datasets")
ords <- read.csv("Orders.csv")
str(ords)
ord_date <-strptime(ords$Order.Date,"%d-%b-%y")

# Sequence of Dates
TransDate <- seq(from=as.Date("2021-06-20"),
                 length=30,by="month")
TransDate

# Difference in Dates
dt2 <- as.Date("2018-02-21")
dt3 <- as.Date("2018-01-03")

dt2 - dt3

dt3 + 5


# POSIXct class
dt1 <- Sys.time()

class(dt1)
unclass(dt1)


# POSIXlt class
dt1 <- Sys.time()
dt_lt <- as.POSIXlt(dt1)
dt_lt
unclass(dt_lt)
dt_lt$sec
dt_lt$hour
dt_lt$mon

###############################################

library(lubridate)
#####Parsing with dates
dmy(150916)
myd("03-2016-15")
ymd("151210")
ydm("16/01/05")
dym("15-2015-01")
mdy("04-26-2016")
ymd_hms("2011-06-10 14:20:48")
dmy("23-September-19")

#######parse_date_time

dt<- "24, Mar 2019 09:11:34"
class(dt)
dt_prs <- parse_date_time(dt, "dmy_HMS")
class(dt_prs)
dt_prs

#####
dt_1 <- 20022015
class(dt_1)
dt_prs1 <- parse_date_time(dt_1, "dmy")
class(dt_prs1)
dt_prs1
unclass(dt_prs1)

####as_date
dt2 <- as_date("2015-09-26")
dt2
class(dt2)

####make_datetime
make_datetime(year=2014, month = 11, day = 18,
              hour = 09, min = 35, sec = 14)
dt_prs <- make_datetime(year=2014, month = 11, day = 18,
                     hour = 09, min = 35, sec = 14)
class(dt_prs)

##### Extraction of component
dt_prs
date(dt_prs)
day(dt_prs)
month(dt_prs)
month(dt_prs, abbr = F, label = T)
year(dt_prs)
hour(dt_prs)
minute(dt_prs)
second(dt_prs)
wday(dt_prs)
wday(dt_prs,label = T,abbr = F)
yday(dt_prs)
mday(dt_prs)
week(dt_prs)
tz(dt_prs)
quarter(dt_prs)


######Setting of date-time component

dt_st <- ymd_hms("2016-09-15 18:20:45")
dt_st
date(dt_st)<- as.Date("2017-10-14")
dt_st
day(dt_st)<-12
dt_st
month(dt_st) <- 03
dt_st
year(dt_st) <- 2015
dt_st
hour(dt_st) <- 15
dt_st
minute(dt_st) <- 11
dt_st
second(dt_st) <- 08
dt_st

#############################################
dt_st <- ymd_hms("2016-09-15 18:20:45")
month(dt_st) <- month(dt_st)+1
dt_st

year(dt_st) <- year(dt_st)+1
dt_st

