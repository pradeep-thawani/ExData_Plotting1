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
png(file = "plot4.png")
par(mfrow = c(2,2))
plot(powerCons$Date, powerCons$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
powerCons$Voltage <- as.numeric(levels(powerCons$Voltage))[powerCons$Voltage]
plot(powerCons$Date, powerCons$Voltage, type = "l", ylab = "Voltage", xlab = "")
plot(powerCons$Date, powerCons$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(powerCons$Date, powerCons$Sub_metering_2, type = "l", col = "red")
lines(powerCons$Date, powerCons$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
powerCons$Global_reactive_power <- as.numeric(levels(powerCons$Global_reactive_power))[powerCons$Global_reactive_power]
plot(powerCons$Date, powerCons$Global_reactive_power, type = "l", ylab = "Voltage", xlab = "")

dev.off()