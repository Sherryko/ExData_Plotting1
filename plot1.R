## Load data
library(data.table)
powerdata <- data.table::fread("household_power_consumption.txt", na.strings="?")

## Convert the Date to Date class
powerdata[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]


## Filter Dates 
powerdata <- powerdata[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

## Plot
png("plot1.png", width = 480, height = 480 )
hist(powerdata[, Global_active_power], main="Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

dev.off()
