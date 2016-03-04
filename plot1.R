setwd("C:/Users/lycnb/Specilization in data science/Exploratory analysis/exdata-data-household_power_consumption")
PoA<-read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=200000,stringsAsFactors = FALSE)
library(dplyr)
PoA1<-subset(PoA,PoA$Date %in% c("1/2/2007","2/2/2007"))
#attach the data set, do not need to give the entire dataset name
attach(PoA1)
PoA1$Global_active_power<-as.numeric(PoA1$Global_active_power)
hist(PoA1$Global_active_power,col="red",main="Globa Active Power",xlab = "Globa Active Power (killowatts)")
setwd("C:/Users/lycnb/Specilization in data science/Exploratory analysis/ExData_Plotting1")
dev.copy(png,file="plot1.png",width = 480, height = 480)
#the png can only be viewed after the rstudio is closed
dev.off()