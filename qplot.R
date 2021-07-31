library(carData)
data("Salaries")
names(Salaries)

library(ggplot2)
qplot(yrs.service , salary , data=Salaries)

# Giving title and labels
qplot(yrs.service , salary , data=Salaries,
      main = "Scatter Plot",
      xlab = "Years of Service", ylab = "Salary")

qplot(yrs.service , salary , data=Salaries, main = "Scatter Plot",
      xlab = "Years of Service", ylab = "Salary")  +
  theme(plot.title = element_text(hjust = 0.5))

qplot(yrs.service, salary, data=Salaries,
      color = rank)

qplot(yrs.service , salary , data=Salaries ,
      color = sex)

qplot(yrs.service , salary , data=Salaries ,
      shape = rank)

qplot(yrs.service , salary , data=Salaries ,
      shape = rank,color = sex)

qplot(yrs.service , salary , data=Salaries ,
      color = yrs.since.phd)
qplot(yrs.service , salary , data=Salaries ,
      color = yrs.since.phd) +
  scale_color_gradient(low = "red",high = "blue")


qplot(yrs.service , salary , data=Salaries ,
      size = yrs.since.phd)

qplot(yrs.service , salary , data=Salaries ,
      size = yrs.since.phd,
      color = rank)

qplot(yrs.service , salary , data=Salaries ,
      size = yrs.since.phd,
      color = rank , shape = discipline)

qplot(yrs.service , salary , data=Salaries ,
      geom=c("point","smooth"))
qplot(yrs.service , salary , data=Salaries ,
      geom=c("point","smooth"),method="lm")

qplot(yrs.service , data=Salaries ,
      bins = 6 )

qplot(yrs.service , data=Salaries ,
      binwidth = 7 )

qplot(yrs.service , data=Salaries ,
      binwidth = 3 , fill="red")

qplot(yrs.service , data=Salaries ,
      binwidth = 3 , fill=rank)

qplot(yrs.service , data=Salaries ,
      binwidth = 3 , fill=sex)

qplot(yrs.service , data=Salaries ,
      geom = "density" )

qplot(yrs.service , data=Salaries ,
      geom = "density" , color=rank)

qplot(yrs.service , data=Salaries ,
      geom = "density" , fill=rank)

qplot(y = yrs.service , data=Salaries ,
      geom = "boxplot" )
qplot(x = yrs.service , data=Salaries ,
      geom = "boxplot" )

qplot(x=rank,y=yrs.service , data=Salaries ,
      geom = "boxplot" )

qplot(yrs.service , data=Salaries ,
      geom = "density" )
qplot(yrs.service , data=Salaries ,
      geom = "density" ,color=rank)

qplot(yrs.service , data=Salaries ,
      geom = "density" , facets = .~rank)

qplot(yrs.service , data=Salaries ,
      geom = "density" , facets = rank~.)

qplot(yrs.service , data=Salaries ,
      geom = "density" , facets = discipline~rank)

qplot(yrs.service , salary , data=Salaries ,
      facets = discipline~rank)

qplot(y=salary , data=Salaries ,
      facets = discipline~sex,geom = "boxplot")
