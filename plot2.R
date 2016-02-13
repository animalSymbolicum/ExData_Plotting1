### Exporatory Data Analysis Assignment 1 - plot 2

# clear workspace
rm(list = ls())

# set wd to directory with dataset
setwd("")

# load dataset 
powerData <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

# subset data period of 1st & 2nd Feb 2007
snapshotData <- powerData[powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007", ] 

# combine time and date and save as POSIXlt calender class
snapshotData$Datetime <- paste(snapshotData$Date, snapshotData$Time)
snapshotData$Datetime <- strptime(snapshotData$Datetime, format = "%d/%m/%Y %H:%M:%S")

## plot 2 
png("plot2.png")
with(snapshotData, { 
  plot(Datetime, Global_active_power, type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = "")
})
dev.off()