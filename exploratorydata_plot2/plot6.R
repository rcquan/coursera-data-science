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

# Subset Baltimore data by motor vehicle emissions
Balt <- NEI[NEI$fips =="24510",]
Baltvehicle <- SubsetByWord("vehicle", Balt)
County <- c(rep("Baltimore", 4))
Baltvehicle <- cbind(Baltvehicle, County)

# Subset LA data by motor vehicle emissions
LA <- NEI[NEI$fips =="06037",]
LAvehicle <- SubsetByWord("vehicle", LA)
County <- c(rep("Los Angeles", 4))
LAvehicle <- cbind(LAvehicle, County)

# Create dataframe with aggregate vehicle emissions from both counties
final <- rbind(LAvehicle, Baltvehicle)

# Plot 6
library(lattice)

png("plot6.png", height = 600, width = 480)
xyplot(Emissions ~ year | County, data = final, type = "l",
       xlab = "Year", ylab = "PM2.5 Emitted (in tons)",
       main = "Total PM2.5 Emission from Motor Vehicles in Two Counties")
dev.off()
