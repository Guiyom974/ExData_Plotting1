library(data.table)

## Download and unzip the dataset:
file <- "2Fhousehold_power_consumption.zip"
if (!file.exists(file)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileURL, file, method="curl")
}  
if (!file.exists("household_power_consumption.txt")) { 
    unzip(file) 
}

## Load data
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Converts to date format
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Converts to numeric and create sub values
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)

## Create submetering subsets
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

## Creates png picture
png("plot4.png", width=480, height=480)

## Sets mode for 4 x 4 graph
par(mfrow = c(2, 2)) 


## Generates graphic 1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

## Generates graphic 2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

## Generates graphic 3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

## Generates graphic 4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()