# Set your working directory
setwd("/Users/Quan/GitHub/ExData_Plotting2/")

# Read data into R
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
fileName <- "pm25.zip"
download.file(url, fileName, method = "curl")
unzip(fileName)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by keyword in SCC, aggregate on keyword
SubsetByWord <- function(word, data){
        index <- SCC[(grep(word, SCC$EI.Sector, ignore.case = TRUE)),]
        SCCvalue <- unique(index$SCC)
        subset <- data[data$SCC %in% SCCvalue,]
        df <- aggregate(Emissions~year, data = subset, sum)
        return(df)
}

Balt <- NEI[NEI$fips =="24510",]
Baltvehicle <- SubsetByWord("vehicle", Balt)

# Plot 5
png("plot5.png", height = 480, width = 480)
plot(Baltvehicle$year, Baltvehicle$Emissions, type = "l",
     lwd = 7,
     col = "dark blue",
     ylab = "PM2.5 Emitted (in tons)",
     xlab = "Year",
     xlim = c(1999, 2008),
     ylim = c(0, 500),
     axes = F)
axis(side = 1, at = c(1999, 2002, 2005, 2008), lwd = 0)
axis(side = 2, tck = 1, cex.axis = 1) 
title("Total PM2.5 Emissions from Motor Vehicles \n in Baltimore, MD from 1999 to 2008")
dev.off()
