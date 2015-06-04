source("util.R")
data <- load_data()	# Load the relevant data from the file

png(file = "plot4.png", width = 480, height = 480)

#Plot[1,1]
par(mfrow = c(2, 2), mar = c(4, 4, 2, 2), oma = c(0, 0, 0, 0))
with(data, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
#Plot[1,2]
with(data, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
#Plot[2,1]
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", bty = "n", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Plot[2,2]
with(data, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()