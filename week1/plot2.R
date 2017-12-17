file <- file("data/household_power_consumption.txt")
Data <- read.csv(file, header = T, sep = ';', na.strings = "?")

Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")
DataSorted <- subset(Data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))



datetime <- paste(as.Date(DataSorted$Date), DataSorted$Time)
DataSorted$Datetime <- as.POSIXct(datetime)

png("plot2.png",height=480,width=480)

plot(DataSorted$Global_active_power ~ DataSorted$Datetime, type = "l",xlab="", ylab = "Global Active Power (kilowatts)")

dev.off()