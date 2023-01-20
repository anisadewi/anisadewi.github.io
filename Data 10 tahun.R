#Metopel Data

setwd("C:/Users/harto/OneDrive/Documents/uas metopel")
library("readxl")
library("tidyverse")

#Membaca data
dat<-read_excel('Ekspor Tembakau.xlsx')

#Plot X dan Y
plot(dat$X,dat$Y,xlab="kuantitas ekspor",ylab="ekspor value")

#regresi data
reg1<-lm(Y~X,data=dat)
summary(reg1)

#membuat error
dat$u<-resid(reg1) #generate error

#plot error
plot(dat$Y,dat$u,xlab="kuantitas ekspor",ylab="ekspor value") # plot error vs Y

#data vis
ggplot(data=dat,aes(x=X,y=Y))+
  geom_point()

#membuat labels
ggplot(data=dat,aes(x=X,y=Y)) +
  geom_point(color="blue") + 
  labs(title="hubungan Kuantitas dengan Nilai Ekspor",
       x="Kuantitas ekspor",
       y="ekspor value",
       caption = "Sumber: Trade Map") +
  theme_minimal()

