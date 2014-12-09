# Set your working directory
setwd("/Users/Quan/GitHub/ExData_Plotting2/")

# Read data into R
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
fileName <- "pm25.zip"
download.file(url, fileName, method = "curl")
unzip(fileName)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate Baltimore data by year and type
Balt <- NEI[NEI$fips =="24510",]
typeBalt <- aggregate(Emissions ~ year + type, data = Balt, sum)

# Plot 3
library(ggplot2)

png("plot3.png", height = 480, width = 480)
g <- ggplot(typeBalt, aes(x = year, y = Emissions)) + geom_line(col = "dark blue") +
        facet_wrap(~ type, ncol = 2) + ylab("PM2.5 Emitted (in tons") + xlab("Year") +
        ggtitle("PM2.5 Emissions in Baltimore, MD by Source")
g
dev.off()