library(sqldf) ## load the needed library 
myFile <- "/Users/craiglab/Downloads/household_power_consumption.txt"
mySql <- "SELECT * FROM file WHERE Data = '1/2/2007'OR Date = '2/2/2007'"
dfData <- read.csv2.sql(myFile, mySql) ## read in data
dfData$Global_active_power <- as.numeric(as.character(dfData$Global_active_power))
png(filename = "plot1.png")
hist(dfData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Globel Active Power(kilowatts)")
dev.off()
