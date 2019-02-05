install.packages("data.table")
library(data.table)
## Read the data set
powerData <- fread("./Data/household_power_consumption.txt")
## Get subset of dates
subsetData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"),]
modifiedDT <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(modifiedDT, as.numeric(subsetData$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


