#DATA PREPARATION
setwd("C:/Users/Juan Palacios/Downloads")
data<-read.table("household_power_consumption.txt",sep = ";",skip=1)
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data<- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
data$Time<-strptime(data$Time,format="%H:%M:%S")

#Create Variable
GAP<-as.numeric(data$Global_active_power)
Time<-data$Time

#Create and save plot

png("plot3.png")

plot(data$Time,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(data,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(data,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(data,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()
