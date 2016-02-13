### Exporatory Data Analysis Assignment 1 - plot 1

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
  
## plot1 
png("plot1.png")
with(snapshotData, {
  hist(
    Global_active_power,
    col = "red",
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)"
  )
})
dev.off()