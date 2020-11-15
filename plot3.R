## Load data
library(data.table)
powerdata <- data.table::fread("household_power_consumption.txt", na.strings="?")

## Make a POSIXct date
powerdata[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

## Filter Dates 
powerdata <- powerdata[(DateTime >= "2007-02-01") & (DateTime <= "2007-02-02")]

## Plot
png("plot3.png", width = 480, height = 480 )
plot(powerdata[, DateTime], powerdata[, Sub_metering_1], type="l", 
     xlab="", ylab="Energy sub metering")
lines(powerdata[, DateTime], powerdata[, Sub_metering_2], col = "Red")
lines(powerdata[, DateTime], powerdata[, Sub_metering_3], col = "Blue")
legend("topright", col = c("Black", "Red", "Blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1), lwd = c(1,1))

dev.off()
