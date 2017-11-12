dataF <- "household_power_consumption.txt"
data <- read.table(dataF, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

subM1 <- as.numeric(subData$Sub_metering_1)

subM2 <- as.numeric(subData$Sub_metering_2)

subM3 <- as.numeric(subData$Sub_metering_3)

png("Plot3.png", width=500, height=500)

plot(datetime, subM1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, subM2, type="l", col="orange")

lines(datetime, subM3, type="l", col="purple")

legend("topright", c("Sub_m_1", "Sub_m_2", "Sub_m_3"), lty=2, lwd=3.5, col=c("black", "orange", "purple"))

dev.off()