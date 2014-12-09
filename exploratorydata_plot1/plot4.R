source("loadData.R")

# Loads data if object does not exist
if (exists("electricData") == FALSE){
        electricData <- loadData()
}

# Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(electricData$DateTime, electricData$Global_active_power, type = "l", # 1st Plot
     xlab = "", ylab = "Global Active Power (kilowatts)") 

with(electricData, plot(DateTime, Voltage, type = "l")) # 2nd Plot

with(electricData, plot(DateTime, Sub_metering_1, type = "l", # 3rd Plot
                        ylab = "ENergy sub metering", xlab = ""))
with(electricData, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(electricData, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), cex = 0.7, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(electricData, plot(DateTime, Global_reactive_power, type = "l")) # 4th Plot
dev.off()
