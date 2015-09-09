## Project 1 for 4. Exploratory Data Analysis ##
## Data: Individual household electric power consumption Data Set from UC irvine machine Learning Repository ##

rm(list=ls())
data.path = "/Users/ouakira/Dropbox/Learning and Job/Coursera/Data Science/4. Exploratory Data Analysis/Assignments/"
setwd(data.path)
rawDS = read.table(paste(data.path,'household_power_consumption.txt',sep=''),header=T,
                   stringsAsFactors = F, sep=';',na.strings = '?')
head(rawDS)
str(rawDS)                      
power.cons <- rawDS[as.Date(rawDS$Date,"%d/%m/%Y")%in%as.Date(c('2007-02-01', '2007-02-02'),"%Y-%m-%d"),]
unique(power.cons$Date)
power.cons$DateTime <- strptime(paste(power.cons$Date,power.cons$Time),"%d/%m/%Y %H:%M:%S")
unique(power.cons$DateTime)
str(power.cons)     

par(mfrow=c(1,1),mar=c(5,5,5,2))
with(power.cons,plot(DateTime,Global_active_power,xlab='',ylab = 'Global Active Power (kilowatts)', main = '',type='l'))
dev.copy(png, file = "plot2.png") 
dev.off()
