##Make sure the data file for "household_power_consumption.txt" is found in your working directory
fulldata <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", stringsAsFactors = FALSE, header = TRUE)
subsetdata <- subset(fulldata, Date == "1/2/2007" | Date == "2/2/2007")
subsetdata$Date <- as.Date(subsetdata$Date, format = "%d/%m/%Y")
datetime <- paste(subsetdata$Date, subsetdata$Time)
datetimedata <- cbind(datetime, subsetdata)
datetimedata$datetime <- as.POSIXct(datetimedata$datetime)
png(filename = "plot3.png")
with(datetimedata, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")) ##create empty plot
lines(datetimedata$Sub_metering_1 ~ datetimedata$datetime, col = "black") ##add in first set of data
lines(datetimedata$Sub_metering_2 ~ datetimedata$datetime, col = "red") ##add in next set of data
lines(datetimedata$Sub_metering_3 ~ datetimedata$datetime, col = "blue") ##add in last set of data
legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()