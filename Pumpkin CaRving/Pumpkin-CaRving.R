#set your filw location -- don't forget to change the addess in quotes to the folder where you have saved pumpkin.csv
setwd("file/location")

#install ggplot2
install.packages("ggplot2")
library(ggplot2)

#read in the pumpkin data
read.csv("pumpkin.csv")
#save the object in your R environment as an object called pumpkin
pumpkin<-read.csv("pumpkin.csv")
#show the first few lines of the data
head(pumpkin)

#building up the plot command
ggplot()
ggplot(data=pumpkin)
ggplot(data=pumpkin, aes(x=x, y=y))

#this will plot a pumpkin-shaped scatter plot
ggplot(data=pumpkin, aes(x=x, y=y))+
  geom_point()

#turn the points red
ggplot(data=pumpkin, aes(x=x, y=y))+
  geom_point(colour="red")

#colour the points according to the variable label
ggplot(data=pumpkin, aes(x=x, y=y, colour=label))+
  geom_point()

#specify that the variable label is categorical, not continuous
pumpkin$label<-as.factor(pumpkin$label)

#colour the points according to the variable label
ggplot(data=pumpkin, aes(x=x, y=y, colour=label))+
  geom_point()

#change the colours assigned to each value of label (in the order 1-12)
ggplot(data=pumpkin, aes(x=x, y=y, colour=label))+
  geom_point()+
  scale_colour_manual(values=c("orange","orange","orange","orange","orange","orange","green","green","green","black","black","black"))

#install dplyr package and load it
install.packages("dplyr") 
library(dplyr) 

#recode the variable label into a variable with three categories that form different parts of the pumpkin
pumpkin$part<-recode(pumpkin$label, `1`="body", `2`="body", `3`="body", `4`="body", `5`="body", `6` ="body", `7`="stalk", `8`="stalk", `9`="stalk", `10`="face", `11`="face", `12`="face") 

#colour the pumpkin according to these parts
ggplot(data=pumpkin, aes(x=x, y=y, colour=part))+
  geom_point()+
  scale_colour_manual(values=c("orange","green","black"))

#remove the plot legend
ggplot(data=pumpkin, aes(x=x, y=y, colour=part))+
  geom_point()+
  scale_colour_manual(values=c("orange","green","black"))+
  theme(legend.position="none")

#change the theme to dark
ggplot(data=pumpkin, aes(x=x, y=y, colour=part))+
  geom_point()+
  scale_colour_manual(values=c("orange","green","black"))+
  theme(legend.position="none")+
  theme_dark()

#reorder commands to remove legend with dark theme
ggplot(data=pumpkin, aes(x=x, y=y, colour=part))+
  geom_point()+
  scale_colour_manual(values=c("orange","green","black"))+
  theme_dark()+
  theme(legend.position="none")

#remove grid lines
ggplot(data=pumpkin, aes(x=x, y=y, colour=part))+
  geom_point()+
  scale_colour_manual(values=c("orange","green","black"))+
  theme_dark()+
  theme(legend.position="none", panel.grid=element_blank())

#turn plot background black and plot panel blue
ggplot(data=pumpkin, aes(x=x, y=y, colour=part))+
  geom_point()+
  scale_colour_manual(values=c("orange","green","black"))+
  theme_dark()+
  theme(legend.position="none", plot.background=element_rect(fill="black"), panel.background = element_rect(fill="midnightblue"))

#remove axis ticks, text and titles
ggplot(data=pumpkin, aes(x=x, y=y, colour=part))+
  geom_point()+
  scale_colour_manual(values=c("orange","green","black"))+
  theme_dark()+
  theme(legend.position="none", axis.ticks = element_blank(), axis.text = element_blank(), axis.title = element_blank())

#save pumpkin as a png file
png(filename="my_pumpkin.png")

ggplot(data=pumpkin, aes(x=x, y=y, colour=part))+
  geom_point()+
  scale_colour_manual(values=c("orange","green","black"))+
  theme_dark()+
  theme(legend.position="none", panel.grid=element_blank())

dev.off()

#save pumpkin as png file with width and height of 5 inches and resolution of 300 dpi
png(filename="my_pumpkin.png", width=5, height=5, units="in", res=300)

ggplot(data=pumpkin, aes(x=x, y=y, colour=part))+
  geom_point()+
  scale_colour_manual(values=c("orange","green","black"))+
  theme_dark()+
  theme(legend.position="none", panel.grid=element_blank())

dev.off()