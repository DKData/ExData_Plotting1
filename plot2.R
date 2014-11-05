#read data
data<- read.csv("household_power_consumption.txt", sep=';', colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings="?")

#subset data to just 2 days
datasubset<- subset(data, as.Date(data[,1], format="%d/%m/%Y") == as.Date("2007-02-01") | as.Date(data[,1],format="%d/%m/%Y") == as.Date("2007-02-02") )

#plot graph
plot(as.POSIXct(strptime(paste(datasubset$Date,datasubset$Time), "%d/%m/%Y %H:%M:%S")), datasubset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# create image
dev.copy(png, file="plot2.png")
dev.off()