data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
data<-data[(data$Date=="2/2/2007"|data$Date=="1/2/2007"),]
data$Global_active_power<-as.character(data$Global_active_power)
data$Global_active_power<-as.numeric(data$Global_active_power)
png(filename="plot1.png",width=480,height=480)
hist(data$Global_active_power,col='red',xlab="Global Active Power(kilowatts)",main="Global Active Power")
dev.off()