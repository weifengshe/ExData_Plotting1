library(sqldf) ## load the needed library 
myFile <- "/Users/craiglab/Downloads/household_power_consumption.txt"
mySql <- "SELECT * FROM file WHERE Data = '1/2/2007'OR Date = '2/2/2007'"
dfData <- read.csv2.sql(myFile, mySql) ## read in data
dfData$Global_active_power <- as.numeric(as.character(dfData$Global_active_power)) ### convert varible to numeric

dfData$Date <- as.Date(dfData$Date, "%d/%m/%Y") # convert data to Date varible
dfData$Date2 <- strptime(paste(subdata$Date, subdata$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

## convert data type 
dfData$Sub_metering_1 <- as.numeric(as.character(dfData$Sub_metering_1))
dfData$Sub_metering_2 <- as.numeric(as.character(dfData$Sub_metering_2))
dfData$Sub_metering_3 <- as.numeric(as.character(dfData$Sub_metering_3))
plot.new()

png("plot3.png")
plot(dfData$Date2, dfData$Sub_metering_1, col = "black", type = "l", xlab ="", ylab = "Energy sub metering", ylim = range(dfData$Sub_metering_1,
                                                                                                                            dfData$Sub_metering_2, dfData$Sub_metering_3))
points(dfData$Date2, dfData$Sub_metering_2, col = "red", type = "l", ylim = range(dfData$Sub_metering_1,
                                                                                    dfData$Sub_metering_2, dfData$Sub_metering_3))
points(dfData$Date2, dfData$Sub_metering_3, col = "blue", type = "l", ylim = range(dfData$Sub_metering_1,
                                                                                     dfData$Sub_metering_2, dfData$Sub_metering_3))
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", 
                                                                                 "Sub_metering_3"))

dev.off()