##Make sure the data file for "household_power_consumption.txt" is found in your working directory
fulldata <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", stringsAsFactors = FALSE, header = TRUE)
subsetdata <- subset(fulldata, Date == "1/2/2007" | Date == "2/2/2007")
subsetdata$Date <- as.Date(subsetdata$Date, format = "%d/%m/%Y") ##Date was "character", changing to "Date"
datetime <- paste(subsetdata$Date, subsetdata$Time) ##need a datetime variable in order to get the continuous plot
datetimedata <- cbind(datetime, subsetdata)
datetimedata$datetime <- as.POSIXct(datetimedata$datetime) ##Time was "character", changing datetime to "Date"
png(filename = "plot2.png")
plot(datetimedata$Global_active_power ~ datetimedata$datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
