library(carData)
data("Salaries")

library(ggplot2)
p <- ggplot(data=Salaries,aes(x=yrs.service,y=salary))
print(p)

p+geom_point()
p+geom_point()+geom_line()

ggplot(Salaries,aes(yrs.service,salary))+
  geom_point()

ggplot(Salaries,aes(yrs.service,salary,color=rank))+
  geom_point()

ggplot(Salaries,aes(yrs.service,salary,color=rank,
                    shape=discipline))+ geom_point()

p <- ggplot(Salaries,aes(yrs.service,salary))
p+geom_point()+geom_smooth()

p+geom_point()+geom_smooth(method="lm")

p+geom_point()+geom_smooth(method="lm",se=FALSE)

p+geom_point()+geom_smooth(method="lm",size=1,
                           linetype=2,se=FALSE)

p+geom_point()+geom_smooth(method="lm",size=1,
                           linetype=3,se=FALSE)

# Boxplot
ggplot(Salaries, aes(y=salary))+
  geom_boxplot()

# Horizontal
ggplot(Salaries, aes(y=salary))+
  coord_flip()+
  geom_boxplot()

ggplot(Salaries, aes(x=rank,y=salary))+
  geom_boxplot()

ggplot(Salaries, aes(x=rank,y=salary))+
  geom_boxplot(fill=c("red","green","blue"))

ggplot(Salaries, aes(x=rank,y=salary,fill=rank))+
  geom_boxplot()

ggplot(Salaries, aes(x=rank,y=salary))+
  geom_boxplot(color=c("red","green","blue"))


# Histogram
ggplot(Salaries,aes(x=salary)) + geom_histogram()

ggplot(Salaries,aes(x=salary)) +
  geom_histogram(bins=20,fill="pink",color="red")

ggplot(Salaries,aes(x=salary)) +
  geom_histogram(binwidth = 25000,
                 fill="lightskyblue2",color="blue")

# Density
ggplot(Salaries, aes(x=salary))+geom_density()

ggplot(Salaries, aes(x=salary,color=rank))+
  geom_density()

ggplot(Salaries, aes(x=salary,fill=rank))+
  geom_density()
ggplot(Salaries, aes(x=salary,fill=rank))+
  geom_density(alpha=0.5)

# Bar Chart
ggplot(Salaries, aes(rank)) +
  geom_bar(fill="steelblue4")

ggplot(Salaries, aes(rank,fill=discipline))+
  geom_bar()

ggplot(Salaries, aes(rank,fill=discipline))+
  geom_bar(position = 'dodge')

ggplot(Salaries, aes(rank,fill=discipline))+
  coord_flip()+
  geom_bar(position = 'dodge')

### Plotting the Descriptive Statistics
library(dplyr)
meanSals <- Salaries %>%
  group_by(rank) %>%
  summarise(Mean=mean(salary,na.rm = T))

ggplot(data=meanSals,aes(x=rank,y=Mean))+
  geom_bar(stat = "identity",
           fill=c("steelblue2","yellow1","thistle"))


ggplot(data=meanSals,aes(x=rank,y=Mean))+
  geom_bar(stat = "identity",
           fill=c("steelblue2","yellow1","thistle"))+
  geom_text(aes(label=format(Mean,digits = 6)),size=4,
            vjust=1.5)


## Facet

p+geom_point()+geom_smooth(method="lm")+
  facet_grid(.~rank)

p+geom_point()+geom_smooth(method="lm")+
  facet_grid(rank~.)

p+geom_point()+geom_smooth(method="lm")+
  facet_grid(discipline~rank)

p+geom_point()+geom_smooth(method="lm")+
  facet_wrap(~rank,nrow = 2)

p+geom_point()+geom_smooth(method="lm")+
  facet_wrap(~rank,ncol = 2)

p+geom_point(color="blue")

p+geom_point(color="blue",alpha=0.3)

ggplot(Salaries,aes(yrs.service,salary,size=yrs.since.phd))+
  geom_point(color="blue",  alpha=1/4)

p+geom_point(aes(color=rank), size=2, alpha=1/4)

p+geom_point(aes(color=rank), size=2, alpha=1/4)+
  labs(title="Plot by Rank")+
  labs(x="Years in Service",y="Salary",color='Rank')+
  theme(plot.title = element_text(hjust = 0.5))

p+geom_point(aes(color=rank), size=2, alpha=3/4)+
  labs(title="Plot by Rank")+
  labs(x="Years in Service",y="Salary")+
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

## Saving the graph
setwd("F:/R Course (C-DAC)/4. Statistical Graphics")
ggplot(Salaries,aes(x=salary)) +
  geom_histogram(bins=20)+ggsave("Histo.pdf")

ggplot(Salaries,aes(x=salary)) +
  geom_histogram(bins=20)+ggsave("Histo.jpg")

## Themes
ggplot(Salaries,aes(yrs.service,salary,color=rank))+
  geom_point() +
  theme_light()

library(ggthemes)
ggplot(Salaries,aes(yrs.service,salary,color=rank))+
  geom_point() +
  theme_foundation()

## Customising themes
ggplot(Salaries,aes(yrs.service,salary,color=rank))+
  geom_point() +
  theme_light() +
  theme(legend.position = "top")

##########################################

library(plotly)

ggplotly(ggplot(Salaries, aes(x=rank,y=salary))+
           geom_boxplot(fill=c("red","green","blue")))

ggplotly(p+geom_point(color="blue",alpha=0.3))

ggplotly(ggplot(Salaries,aes(x=salary)) +
           geom_histogram(bins=20,fill="pink",color="red"))
