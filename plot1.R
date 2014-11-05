#read data
data<- read.csv("household_power_consumption.txt", sep=';', colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings="?")

#subset data to just 2 days
datasubset<- subset(data, as.Date(data[,1], format="%d/%m/%Y") == as.Date("2007-02-01") | as.Date(data[,1],format="%d/%m/%Y") == as.Date("2007-02-02") )

#create histogram
hist(as.numeric(datasubset$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

# create image
dev.copy(png, file="plot1.png")
dev.off()