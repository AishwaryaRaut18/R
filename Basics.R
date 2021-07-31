resp <- c("N","Y","N","Y","Y","CS","Y","CS")
class(resp)
f_resp <- factor(resp)
class(f_resp)
f_resp

f_resp <- factor(resp,levels = c("Y","N","CS"))
f_resp


mat1 <- matrix(c(1,3,4,2,4,6),3,2)
mat1
mat2 <- matrix(c(1,3,4,2,4,6),3,2, byrow = T)
mat2

a <- 2:7
b <- 31:45

d <- rbind(a,b)
d

f <- 101:105
g <- rbind(f,b)
g

k <- array(dim = c(8))
k[1] <- 48
k[6] <- 90

d <- array(dim = c(3,4))
d
d[1,3] <- 4
d[3,2] <- 7


g <- array(dim = c(2,5,8))

a <- c(2,4,5,1)
b <- c(0,3,1,5)
df <- data.frame(a,b)
colnames(df)
colnames(df) <- c("w","x")
df
names(df)

fit <- lm(mpg ~ ., data=mtcars)
################################
setwd("F:/R Course/Datasets")
mem <- read.table("members.txt",header = T,skip = 1)


boly <- read.csv("F:/R Course/Datasets/Bollywood_2015.csv")
boly <- read.csv("Bollywood_2015.csv")

################################
setwd("F:/R Course/Datasets")

boly <- read.csv("Bollywood_2015.csv")

boly2 <- read.csv("Bollywood_2015_2.csv")

# File without Header
boly2 <- read.csv("Bollywood_2015_2.csv",header = FALSE)
colnames(boly2) <- c("Movie_Name","BO_Collection",
                     "Budget","Verdict")

# Strings Not as Factors
boly <- read.csv("Bollywood_2015.csv",stringsAsFactors = F)

orders <- read.csv("Orders.csv")
orderdetails <- read.csv("Ord_Details.csv")

ords <- merge(orders,orderdetails,by="Order.ID")

colnames(ords)
names(ords)

fit <- lm(Qty ~ Payment.Terms , data = ords)
names(fit)
colnames(fit)

#Subsetting a vector
x <- c(12,23,52,78,90,10,28,93,95,92,95,79)
x[1:5]
x[c(3,6,9,1)]
x>50
x[x>50]


#Subsetting a list
f <- list(a=1:7, b="XYZ",c=FALSE,d=c(23.4,14,6))
f[1]
f[2]
f$c
f[["c"]]
f["c"]

#Subsetting a matrix
m <- matrix(c(1:12),4,3)
m
m[3,2]
m[2,]
m[,3]
m[,3,drop=FALSE]
# Two rows
m[c(1,3),]

items <- read.csv("Items.csv")

items[2 , ] # only 2nd row
items[c(1,3,5,6) , ] # only rows 1,3,5,6
items[ , 4] # only 4th column
items[ ,  c(2,4)] # only 2nd and 4th column
items[,-c(2,4)] # exclude 2nd and 4th column

items[,"Price"]
items[,c("Price","UOM")]

#Subsetting the data frames

items$Item.Type=="Pen"

items[items$Item.Type=="Pen", ]

items[items$Item.Type!="Pen", ]

which(items$Item.Type=="Pen")

which(items$Brand == "Pilot")

Pens <- items[which(items$Item.Type=="Pen") , ]
ExpPens <- items[which(items$Item.Type=="Pen" &
                         items$Price>200) , ]

Pens <- subset(items,Item.Type == "Pen")

Pilot <- subset(items,Brand == "Pilot")

ExpPens <- subset(items,Item.Type=="Pen" & Price>200)

HighRef <- subset(items,Item.Type=="Highlighter" | Item.Type=="Refill" )

sItem <- subset(items, select = c(Item.ID,Brand,Price))

sItem_aff <- subset(items,subset = Price<100,
                    select = c(Item.ID,Brand,Price))

#Subsetting the NAs
g <- c(43,78,90,NA,12,NaN,32,NA,89,10)
t <- is.na(g)
t
g[t]
g[!t]

e <- c(NA,78,90,32,NA,NaN,32,76,89,10)
f <- c(12,23,43,45,13,NA,13,NA,54,13)
df <- data.frame(g,e,f)
fin <- complete.cases(df)
fin
final <- df[fin, ]

