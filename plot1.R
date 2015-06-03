source("util.R")
data <- load_data()	# Load the relevant data from the file
png(file = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
