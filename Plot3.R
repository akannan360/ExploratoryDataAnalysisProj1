install.packages("data.table")
library(data.table)
## Read the data set
powerData <- fread("./Data/household_power_consumption.txt")
## Get subset of dates
subsetData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"),]
modifiedDT <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(modifiedDT, as.numeric(subsetData$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(modifiedDT, as.numeric(subsetData$Sub_metering_2), type="l", col="red")
lines(modifiedDT, as.numeric(subsetData$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()


