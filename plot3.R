#Invoking tidyverse and lubridate library
suppressPackageStartupMessages(library(tidyverse,warn.conflicts = FALSE))
suppressPackageStartupMessages(library(lubridate,warn.conflicts = FALSE))

#Read Electric power consumption only for dates 1st and 2nd February 2007
file<-"./data/exdata_data_household_power_consumption/household_power_consumption.txt"
cnames<-read.table(file,sep=";",nrows=1)
data<-read.table(file,sep=";",na.strings = "?",col.names=cnames,
                 colClasses=c(rep("character",2),rep("numeric",7)),
                 skip=grep("31/1/2007;23:59:00;",readLines(file)),nrows=60*24*2)
rm(cnames,file)

#Getting a date field
date<-with(data,dmy_hms(paste(Date,Time)))

#plot 3
png("plot3.png")
with(data,plot(date,Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering",col="black"))
with(data,lines(date,Sub_metering_2,col="red"))
with(data,lines(date,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=c(1,1,1))
dev.off()