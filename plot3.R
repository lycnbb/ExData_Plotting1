setwd("C:/Users/lycnb/Specilization in data science/Exploratory analysis/exdata-data-household_power_consumption")
PoA<-read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=200000,stringsAsFactors = FALSE)
library(dplyr)
PoA1<-subset(PoA,PoA$Date %in% c("1/2/2007","2/2/2007"))
#attach the data set, do not need to give the entire dataset name
attach(PoA1)
PoA1$Global_active_power<-as.numeric(PoA1$Global_active_power)
x<-paste(Date,Time)
PoA1$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
class(PoA1$Sub_metering_1)="numeric"
class(PoA1$Sub_metering_2)="numeric"
class(PoA1$Sub_metering_3)="numeric"
#initiate the plot
with(PoA1,plot(DateTime,Sub_metering_1,type="l",col="black",ylab = "Energy sub metering"))
#add lines
lines(DateTime,Sub_metering_2,col="red")
lines(DateTime,Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                        lwd=1)
dev.copy(png,"plot3.png",width=480,height=480)
dev.off()