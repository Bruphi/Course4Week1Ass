dataF <- "household_power_consumption.txt"
data <- read.table(dataF, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
globalactivepower <- as.numeric(subSetData$global_active_power)
png("Plot1.png", width=500, height=500)
hist(globalActivePower, col="red", main="global active power", xlab="global active power (kw)")
dev.off()