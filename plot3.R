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

par(mfrow=c(1,1),mar=c(5,5,2,2))
with(power.cons,plot(DateTime,Sub_metering_1,xlab = '',ylab='Energy Sub Metering', main = '',type='l'))
with(power.cons,lines(DateTime,Sub_metering_2,col='red'))
with(power.cons,lines(DateTime,Sub_metering_3,col='blue'))
legend("topright",lty=1,col = c("black","red","blue"), cex=0.8,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png") 
dev.off()

