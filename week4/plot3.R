library(ggplot2)

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

baltimore <- subset(NEI,NEI$fips =="24510")

baltimoreType <- aggregate(Emissions ~ year + type, baltimore, sum)


png("plot3.png",height=480,width=480)

ggplot(baltimoreType, aes(year, Emissions, col = type)) +
      geom_line() +
      geom_point() +
      ggtitle(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions by Type and Year")) +
      ylab(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions")) +
      xlab("Year") +
      scale_colour_discrete(name = "Type of sources") +
      theme(legend.title = element_text(face = "bold"))

dev.off()