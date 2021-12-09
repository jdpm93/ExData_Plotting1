#DATA PREPARATION
setwd("C:/Users/Juan Palacios/Downloads")
data<-read.table("household_power_consumption.txt",sep = ";",skip=1)
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data<- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
data$Time<-strptime(data$Time,format="%H:%M:%S")

#CREATE VARIABLE
GAP<-as.numeric(data$Global_active_power)
Time<-data$Time

png("plot2.png")

plot(Time,GAP,main="Global Active Power Vs Time",type = "l")

dev.off()