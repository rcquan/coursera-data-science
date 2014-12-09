# Load data into R

loadData <- function(){
        fileName <- "household_power_consumption.txt"
        if(!file.exists(fileName)){
                url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                zipName <- "household_power_consumption.zip"
                download.file(url, zipName, method = "curl")
                unzip(zipName)
        }
        electricData <- read.table(fileName, header = TRUE, sep = ";", 
                                   colClasses = c("character", "character", rep("numeric", 7)), na = "?")
        # Subset data for the dates 2007-02-02 and 2007-02-01
        electricData$Date <- as.Date(electricData$Date, "%d/%m/%Y")
        electricData <- subset(electricData, electricData$Date %in% as.Date(c("2007-02-02","2007-02-01")))
                
        # Create DateTime variable with Date/Time class
        electricData$DateTime <- strptime(paste(electricData$Date, electricData$Time),
                                                  "%Y-%m-%d %H:%M:%S")
        return(electricData) # data.frame
}