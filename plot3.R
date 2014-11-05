#read data
data<- read.csv("household_power_consumption.txt", sep=';', colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings="?")

#subset data to just 2 days
datasubset<- subset(data, as.Date(data[,1], format="%d/%m/%Y") == as.Date("2007-02-01") | as.Date(data[,1],format="%d/%m/%Y") == as.Date("2007-02-02") )


#create plot
plot(as.POSIXct(strptime(paste(datasubset$Date,datasubset$Time), "%d/%m/%Y %H:%M:%S")), datasubset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")

#add additional data points
points(as.POSIXct(strptime(paste(datasubset$Date,datasubset$Time), "%d/%m/%Y %H:%M:%S")), datasubset$Sub_metering_2, type="l", ylab="Energy sub metering", xlab="", col="red")
points(as.POSIXct(strptime(paste(datasubset$Date,datasubset$Time), "%d/%m/%Y %H:%M:%S")), datasubset$Sub_metering_3, type="l", ylab="Energy sub metering", xlab="", col="blue")

#add legend
legend("topright"
                , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
                ,lwd=c(2.5,2.5, 2.5), col=c("black", "red", "blue")
                ,lty=c(1,1,1)
        )

# create image
dev.copy(png, file="plot3.png")
dev.off()
