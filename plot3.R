### Exporatory Data Analysis Assignment 1 - plot 3

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

## plot3
png("plot3.png")
with(snapshotData, {
  plot(Datetime, Sub_metering_1,
       type = "l", ylab = "Energy sub in metering", xlab = "")
  lines(Datetime, Sub_metering_2, col = "red")
  lines(Datetime, Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "red", "blue"), lwd = 2,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         text.width = 43000)  
})
dev.off()