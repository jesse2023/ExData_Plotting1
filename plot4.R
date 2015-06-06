data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
data<-data[(data$Date=="2/2/2007"|data$Date=="1/2/2007"),]
data$Global_active_power<-as.character(data$Global_active_power)
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-paste(data$Date,data$Time)
data$Time<-strptime(data$Time,"%Y-%m-%d %H:%M:%S")
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
data$Voltage<-as.numeric(as.character(data$Voltage))
data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power))

png(filename="plot4.png",width=480,height=480)
par(mfrow = c(2, 2))

plot(data$Time,data$Global_active_power,cex=0.2,xlab="",ylab="Global Active Power",type="n")
lines(data$Time,data$Global_active_power)

plot(data$Time,data$Voltage,cex=0.2,xlab="datetime",ylab="Voltage",type="n")
lines(data$Time,data$Voltage)

plot(data$Time,data$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(data$Time,data$Sub_metering_1)
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
legend("topright",pch="_",col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

plot(data$Time,data$Global_reactive_power,xlab="datatime",ylab="Global_reactive_power",type="n")
lines(data$Time,data$Global_reactive_power)

dev.off()