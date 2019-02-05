install.packages("data.table")
library(data.table)
## Read the data set
powerData <- fread("./Data/household_power_consumption.txt")
## Get subset of dates
subsetData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"),]
hist(subsetData$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
## Export
dev.copy(png, file = 'plot1.png')
dev.off()