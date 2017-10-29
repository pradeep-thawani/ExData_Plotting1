powerCons <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
powerCons <- subset(powerCons, powerCons$Date=="1/2/2007" | powerCons$Date=="2/2/2007")
powerCons$Date <- as.Date(powerCons$Date, format = "%d/%m/%Y")
powerCons$Time <- strptime(powerCons$Time, format = "%H:%M:%S")
powerCons$Time <- strftime(powerCons$Time, format = "%H:%M:%S")
powerCons$Global_active_power <- as.numeric(levels(powerCons$Global_active_power))[powerCons$Global_active_power]
png(file = "plot1.png")
hist(powerCons$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
