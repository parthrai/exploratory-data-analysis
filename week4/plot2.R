NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

baltimore <- subset(NEI,NEI$fips =="24510")

totalBaltimore <- aggregate(Emissions ~ year, baltimore, sum)

png("plot2.png",height=480,width=480)

plot(totalBaltimore$year, totalBaltimore$Emissions, type = "o", main = expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year"), xlab = "Year", ylab = expression("Total Baltimore "~ PM[2.5] ~ "Emissions"), col = "steelblue3")
dev.off()