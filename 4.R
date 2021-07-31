setwd("D:/Rprogramming/Datasets")
df <- read.csv("SingaporeAuto.csv",stringsAsFactors = TRUE)
boxplot(df$Exp_weights,xlab="weights",col="hotpink")


boxplot(df$Exp_weights ~ df$VehicleType,col=c("6","3","23","34","45","67","89","100","123","124"))

df_1 <- read.csv("cars2.csv")
plot(df_1$speed,df_1$dist,xlab="speed",ylab="distance",pch=4)
