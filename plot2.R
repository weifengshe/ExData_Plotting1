library(sqldf) ## load the needed library 
myFile <- "/Users/craiglab/Downloads/household_power_consumption.txt"
mySql <- "SELECT * FROM file WHERE Data = '1/2/2007'OR Date = '2/2/2007'"
dfData <- read.csv2.sql(myFile, mySql) ## read in data
dfData$Global_active_power <- as.numeric(as.character(dfData$Global_active_power)) ### convert varible to numeric

dfData$Date <- as.Date(dfData$Date, "%d/%m/%Y") # convert data to Date varible
dfData$Date2 <- strptime(paste(subdata$Date, subdata$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png")
plot(dfData$Date2, dfData$Global_active_power, type = "l", ylab = "Global Active Power(kolowatts)", xlab = "")
dev.off()
