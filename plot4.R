##Make sure the data file for "household_power_consumption.txt" is found in your working directory
fulldata <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", stringsAsFactors = FALSE, header = TRUE)
subsetdata <- subset(fulldata, Date == "1/2/2007" | Date == "2/2/2007")
subsetdata$Date <- as.Date(subsetdata$Date, format = "%d/%m/%Y")
datetime <- paste(subsetdata$Date, subsetdata$Time)
datetimedata <- cbind(datetime, subsetdata)
datetimedata$datetime <- as.POSIXct(datetimedata$datetime)
png(filename = "plot4.png")
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))
plot(datetimedata$Global_active_power ~ datetimedata$datetime, type = "l", xlab = "", ylab = "Global Active Power") ##plots topleft corner
plot(datetimedata$Voltage ~ datetimedata$datetime, type = "l", xlab = "datetime", ylab = "Voltage") ##plots topright corner
with(datetimedata, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")) ##plots bottomleft corner
lines(datetimedata$Sub_metering_1 ~ datetimedata$datetime, col = "black")
lines(datetimedata$Sub_metering_2 ~ datetimedata$datetime, col = "red")
lines(datetimedata$Sub_metering_3 ~ datetimedata$datetime, col = "blue")
legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datetimedata$Global_reactive_power ~ datetimedata$datetime, type = "l", xlab = "datetime", ylab = "Global_reactive_power") ##plots bottomright corner
dev.off()