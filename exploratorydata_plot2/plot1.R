# Set your working directory
setwd("/Users/Quan/GitHub/ExData_Plotting2/")

# Read data into R
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
fileName <- "pm25.zip"
download.file(url, fileName, method = "curl")
unzip(fileName)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Total Emissions for US by Year
totalUS <- aggregate(Emissions ~ year, data = NEI, sum)

# Plot 1
png("plot1.png", width = 480, height = 480)
plot(totalUS$year, totalUS$Emissions/10^6, type = "l",
     lwd = 7,
     col = "dark blue",
     ylab = "PM2.5 Emitted (in millions of tons)",
     xlab = "Year",
     xlim = c(1999, 2008),
     ylim = c(0, 10),
     axes = F)
axis(side = 1, at = c(1999, 2002, 2005, 2008), lwd = 0)
axis(side = 2, at = c(0:10.0), tck = 1, cex.axis = 1) 
title("Total PM2.5 Emissions in the United States \n from 1999 to 2008")
dev.off()