source("loadData.R")

# Loads data if object does not exist
if (exists("electricData") == FALSE){
        electricData <- loadData()
}

# Plot 1
png("plot1.png", width = 480, height = 480)
hist(electricData$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()