powerCons <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
powerCons <- subset(powerCons, powerCons$Date=="1/2/2007" | powerCons$Date=="2/2/2007")
powerCons$Date <- as.Date(powerCons$Date, format = "%d/%m/%Y")
powerCons$Time <- strptime(powerCons$Time, format = "%H:%M:%S")
powerCons$Time <- strftime(powerCons$Time, format = "%H:%M:%S")
powerCons$Global_active_power <- as.numeric(levels(powerCons$Global_active_power))[powerCons$Global_active_power]
powerCons$Date <- paste(powerCons$Date,powerCons$Time)
powerCons$Date <- as.POSIXct(powerCons$Date, format = "%Y-%m-%d %H:%M:%S")
powerCons$Sub_metering_1 <- as.numeric(levels(powerCons$Sub_metering_1))[powerCons$Sub_metering_1]
powerCons$Sub_metering_2 <- as.numeric(levels(powerCons$Sub_metering_2))[powerCons$Sub_metering_2]
powerCons$Sub_metering_3 <- as.numeric(levels(powerCons$Sub_metering_3))[powerCons$Sub_metering_3]
png(file = "plot3.png")
plot(powerCons$Date, powerCons$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(powerCons$Date, powerCons$Sub_metering_2, type = "l", col = "red")
lines(powerCons$Date, powerCons$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()