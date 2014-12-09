source("loadData.R")

# Loads data if object does not exist
if (exists("electricData") == FALSE){
        electricData <- loadData()
}

# Plot 3
png("plot3.png", width = 480, height = 480)
with(electricData, plot(DateTime, Sub_metering_1, type = "l",
                        ylab = "ENergy sub metering", xlab = ""))
with(electricData, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(electricData, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = 
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

