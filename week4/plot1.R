NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

totalNEI <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png",height=480,width=480)

plot(totalNEI$year, totalNEI$Emissions, type = "o", col = "steelblue3", main = expression("Total US "~ PM[2.5]~ "Emissions by Year"), ylab = expression("Total US "~   PM[2.5] ~ "Emissions"), xlab = "Year")

dev.off()