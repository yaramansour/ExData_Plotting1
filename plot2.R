data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
data$Timestamp <-paste(data$Date, data$Time)
globalActivePower <- as.numeric(data$Global_active_power)
plot(strptime(data$Timestamp, "%d/%m/%Y %H:%M:%S"), globalActivePower, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")