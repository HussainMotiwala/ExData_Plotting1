#Invoking tidyverse library
suppressPackageStartupMessages(library(tidyverse,warn.conflicts = FALSE))

#Read Electric power consumption only for dates 1st and 2nd February 2007
file<-"./data/exdata_data_household_power_consumption/household_power_consumption.txt"
cnames<-read.table(file,sep=";",nrows=1)
data<-read.table(file,sep=";",na.strings = "?",col.names=cnames,
                 colClasses=c(rep("character",2),rep("numeric",7)),
                 skip=grep("31/1/2007;23:59:00;",readLines(file)),nrows=60*24*2)
rm(cnames,file)

#plot 1
png("plot1.png")
with(data,hist(Global_active_power,xlim=c(0,6),ylim=c(0,1200),
               xlab="Global Active Power (kilowatts)",ylab="Frequency",
               main="Global Active Power",col="red"))
dev.off()




     