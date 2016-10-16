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

## Subsets data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Converts to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)

## Creates png picture
png("plot1.png", width=480, height=480)

## Generates graphic and saves it in picture
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()