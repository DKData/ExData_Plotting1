#read data
data<- read.csv("household_power_consumption.txt", sep=';', colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings="?")

#subset data to just 2 days
datasubset<- subset(data, as.Date(data[,1], format="%d/%m/%Y") == as.Date("2007-02-01") | as.Date(data[,1],format="%d/%m/%Y") == as.Date("2007-02-02") )

# open device
png(file="plot4.png",width=504,height=504)

# set 2 x 2 col/rows
par(mfcol=c(2,2))

#plot 1
plot(as.POSIXct(strptime(paste(datasubset$Date,datasubset$Time), "%d/%m/%Y %H:%M:%S")), datasubset$Global_active_power, type="l", ylab="Global Active Power", xlab="")

#plot2
plot(as.POSIXct(strptime(paste(datasubset$Date,datasubset$Time), "%d/%m/%Y %H:%M:%S")), datasubset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
#plot2 - additional data points
points(as.POSIXct(strptime(paste(datasubset$Date,datasubset$Time), "%d/%m/%Y %H:%M:%S")), datasubset$Sub_metering_2, type="l", ylab="Energy sub metering", xlab="", col="red")
points(as.POSIXct(strptime(paste(datasubset$Date,datasubset$Time), "%d/%m/%Y %H:%M:%S")), datasubset$Sub_metering_3, type="l", ylab="Energy sub metering", xlab="", col="blue")

#plot2 - add legend
legend("topright"
       , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ,lwd=c(2.5,2.5, 2.5), col=c("black", "red", "blue")
       ,lty=c(1,1,1),  bty="n"
)


#plot3
plot(as.POSIXct(strptime(paste(datasubset$Date,datasubset$Time), "%d/%m/%Y %H:%M:%S")), datasubset$Voltage, type="l", ylab="Voltage", xlab="datetime")

#plot4
plot(as.POSIXct(strptime(paste(datasubset$Date,datasubset$Time), "%d/%m/%Y %H:%M:%S")), datasubset$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")


# not using copy as cannot specify image dimensions. using png() allows to specify image size
#dev.copy(png, file="plot4.png")

#close device
dev.off()