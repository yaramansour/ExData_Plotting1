data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
data$Timestamp <-paste(data$Date, data$Time)
globalReactivePower <- as.numeric(data$Global_reactive_power)
globalActivePower <- as.numeric(data$Global_active_power)
voltage <- as.numeric(data$Voltage)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

par(mfcol = c(2,2))

plot(strptime(data$Timestamp, "%d/%m/%Y %H:%M:%S"), globalActivePower, type = "l", 
     xlab = "", ylab = "Global Active Power(kilowatts)")
plot(strptime(data$Timestamp, "%d/%m/%Y %H:%M:%S"), subMetering1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(strptime(data$Timestamp, "%d/%m/%Y %H:%M:%S"),subMetering2, type = "l", col = "red" )
lines(strptime(data$Timestamp, "%d/%m/%Y %H:%M:%S"),subMetering3, type = "l", col = "blue" )
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = 'n',cex=0.6)
plot(strptime(data$Timestamp, "%d/%m/%Y %H:%M:%S"),voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")
plot(strptime(data$Timestamp, "%d/%m/%Y %H:%M:%S"), globalReactivePower, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")