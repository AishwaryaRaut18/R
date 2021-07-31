ProductA <- c(12,43,25)
ProductB <- c(90,34,56)
rb <- rbind(ProductA,ProductB)

barplot(ProductA)
barplot(ProductA,col = "green")
barplot(ProductA,col = c("wheat","aquamarine4","darkgreen"))
barplot(ProductA,horiz  = TRUE)

barplot(rb)
barplot(rb,beside = T)
barplot(rb,beside = T,col = c("red","blue"))

setwd("D:\\RProgramming\\Datasets")
stars <- read.csv("Movie_Stars.csv",stringsAsFactors = T)
#attach(stars)

barplot(table(stars$Gender),col = "brown",
        main = "Gender-Wise Distribution")

barplot(table(stars$Gender),col = "brown",
        main = "Gender-Wise Distribution", horiz = T)

#################Pie Chart##################
i <- c("Food","Fertilizers","Exports","Others")
s <- c(20,38,22,20)
pie(s,main = "Pie Chart",
    col = c("yellowgreen","violetred1","hotpink","dodgerblue4") ,
    labels = i)
#legend(-3,-1,legend = i, fill = c("yellowgreen","violetred1","hotpink","dodgerblue4"),horiz = T,xpd = T)
############################################

### Histogram ########

k <- 6

barplot(table(cut(stars$Income,breaks = k)))

### OR #####

hist(stars$Income)

hist(stars$Income,breaks = 7,xlab="Income",
     main="Distribution of Income", xlim = c(0,20))

hist(stars$Domestic.Gross)

#Scatter Plot
plot(stars$Domestic.Gross,stars$Income,
     xlab="Domestic Gross",
     ylab="Income")

plot(stars$Domestic.Gross,stars$Income,xlab="Domestic Gross",
     ylab="Income", pch=4)
plot(stars$Domestic.Gross,stars$Income,xlab="Domestic Gross",ylab="Income",
     pch=17, col="purple")


gasoline <- read.csv("Gasoline.csv")

plot(gasoline$Week,gasoline$Sales,xlab = "Week",
     ylab = "Sales",type = 'l')
plot(gasoline$Week,gasoline$Sales,xlab = "Week",
     ylab = "Sales",type = 'b')
plot(gasoline$Week,gasoline$Sales,xlab = "Week",
     ylab = "Sales",type = 'b',lty=3,col="red")

# Density Plot

plot(density(stars$Domestic.Gross),
     main="Density of Domestic Gross")

#Box Plot
boxplot(stars$Income)
boxplot(stars$Income,horizontal = TRUE)

boxplot(stars$Domestic.Gross)

boxplot(stars$Domestic.Gross,
        horizontal = TRUE,main="Domestic Gross")

boxplot(stars$Income ~ stars$Gender,
        col = c("hotpink","honeydew1"),main="Income")

boxplot(stars$Domestic.Gross ~ stars$Gender,
        col = c("hotpink","honeydew1"),
        main="Domestic Gross")

# Partitioning the plot area for multiple graphs
par(mfrow=c(1,2))
boxplot(stars$Domestic.Gross)
boxplot(stars$Domestic.Gross ~ stars$Gender,
        col = c("hotpink","honeydew1"),
        main="Domestic Gross")

par(mfrow=c(1,2))
hist(stars$Domestic.Gross)
plot(density(stars$Domestic.Gross))

par(mfrow=c(2,2))
hist(stars$Foreign.Gross)
boxplot(stars$Foreign.Gross)
boxplot(stars$Foreign.Gross ~ stars$Gender)
plot(density(stars$Foreign.Gross))

##Resetting
par(mfrow=c(1,1))

# By column
par(mfcol=c(2,2))
hist(stars$Foreign.Gross)
boxplot(stars$Foreign.Gross)
boxplot(stars$Foreign.Gross ~ stars$Gender)
plot(density(stars$Foreign.Gross))

par(mfcol=c(1,1))

plot(stars$Domestic.Gross,stars$Foreign.Gross)
abline(lm(stars$Foreign.Gross~stars$Domestic.Gross),
       col="red")

hist(stars$Income,breaks = 20,xlab="Income",main="Distribution of Income" )
abline(v = median(stars$Income), col="red",lwd=1) # Annotating the plot
abline(h = 10, col="blue",lwd=3) # Annotating the plot


#Graphical Devices

#pdf
pdf("F:\\R Course (C-DAC)\\4. Statistical Graphics\\HistIncome.pdf")

hist(stars$Income,breaks = 20,xlab="Income",main="Distribution of Income" )
abline(v = median(stars$Income), col="red",lwd=2) # Annotating the plot

dev.off()

# jpeg
jpeg("F:\\R Course (C-DAC)\\4. Statistical Graphics\\HistIncome.jpeg")

hist(stars$Income,breaks = 20,xlab="Income",main="Distribution of Income" )
abline(v = median(stars$Income), col="red",lwd=4) # Annotating the plot

dev.off()
