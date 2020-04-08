##Make sure the data file for "household_power_consumption.txt" is found in your working directory
fulldata <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", stringsAsFactors = FALSE, header = TRUE)
subsetdata <- subset(fulldata, Date == "1/2/2007" | Date == "2/2/2007")
png(filename = "plot1.png")
hist(subsetdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()