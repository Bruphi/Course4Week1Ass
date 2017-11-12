dataF <- "household_power_consumption.txt"
data <- read.table(dataF, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
dateT <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(subData$global_active_power)
png("Plot2.png", width=500, height=500)
plot(datetime, globalActivePower, type="l", xlab="", ylab="global active power (kw)")
dev.off()