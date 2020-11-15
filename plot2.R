## Load data
library(data.table)
powerdata <- data.table::fread("household_power_consumption.txt", na.strings="?")

## Make a POSIXct date
powerdata[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

## Filter Dates 
powerdata <- powerdata[(DateTime >= "2007-02-01") & (DateTime <= "2007-02-02")]

## Plot
png("plot2.png", width = 480, height = 480 )
plot(x = powerdata[, DateTime], y = powerdata[, Global_active_power],
     type = "l", xlab = "", ylab = "Global Active Power" )

dev.off()
