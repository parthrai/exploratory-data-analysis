file <- file("data/household_power_consumption.txt")

Data <- read.csv(file,header=T,sep=";",na.strings="?")

Data$Date <- as.Date(Data$Date,format="%d/%m/%Y")

DataNew <- subset(Data,subset=(Date >="2007-02-01" & Date <= "2007-02-02"))

png("plot1.png",height=480,width=480)

hist(DataNew$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power(killowatts)")

dev.off()