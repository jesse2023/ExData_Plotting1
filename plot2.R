data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
data<-data[(data$Date=="2/2/2007"|data$Date=="1/2/2007"),]
data$Global_active_power<-as.character(data$Global_active_power)
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-paste(data$Date,data$Time)
data$Time<-strptime(data$Time,"%Y-%m-%d %H:%M:%S")

png(filename="plot2.png",width=480,height=480)
plot(data$Time,data$Global_active_power,cex=0.2,xlab="",ylab="Global Active Power(kilomatts",type="n")
lines(data$Time,data$Global_active_power)
dev.off()