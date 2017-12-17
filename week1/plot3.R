file <- file("data/household_power_consumption.txt")

Data <- read.csv(file,header=T,sep=";",na.strings="?")

Data$Date <- as.Date(Data$Date,format="%d/%m/%Y")

DataSorted <- subset(Data,subset=(Date >="2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(DataSorted$Date), DataSorted$Time)
DataSorted$Datetime <- as.POSIXct(datetime)

png("plot3.png",height=480,width=480)

with(DataSorted, {
    plot(Sub_metering_1 ~ Datetime, type = "l", 
    ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(Sub_metering_2 ~ Datetime, col = 'Red')
    lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()