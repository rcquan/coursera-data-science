source("loadData.R")

# Loads data if object does not exist
if (exists("electricData") == FALSE){
        electricData <- loadData()
}

# Plot 2
png("plot2.png", width = 480, height = 480)
plot(electricData$DateTime, electricData$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
