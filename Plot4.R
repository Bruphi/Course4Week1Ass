dataF <- "household_power_consumption.txt"

data <- read.table(dataF, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


dateT <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalactivepower <- as.numeric(subData$Global_active_power)

globalreactivepower <- as.numeric(subData$Global_reactive_power)

voltage <- as.numeric(subData$Voltage)

subM1 <- as.numeric(subData$Sub_metering_1)

subM2 <- as.numeric(subData$Sub_metering_2)

subM3 <- as.numeric(subData$Sub_metering_3)


png("ppplot4.png", width=500, height=500)
par(mfrow = c(2, 2)) 

plot(dateT, globalactivepower, type="l", xlab="", ylab="plobal active power", cex=0.2)

plot(dateT, voltage, type="l", xlab="Datetime", ylab="voltage")

plot(dateT, subM1, type="l", ylab="energy submetering", xlab="")
lines(dateT, subM2, type="l", col="green")
lines(dateT, subM3, type="l", col="purple")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "green", "purple"), bty="o")

plot(dateT, globalreactivepower, type="l", xlab="DateTime", ylab="global_reactive_power")

dev.off()