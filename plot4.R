# Read in the relevant lines, much faster than reading in the whole file
hd <- read.csv2("household_power_consumption.txt", sep = ";", dec='.',
                na.strings = "?", header = TRUE, skip = 66636, nrows = 2880,
                col.name = c('Date','Time','Global_active_power',
                             'Global_reactive_power','Voltage',
                             'Global_intensity','Sub_metering_1',
                             'Sub_metering_2','Sub_metering_3'))

# add a ts column with the POSIXct timestamp
hd$ts <- as.POSIXct(strptime(paste(hd$Date, hd$Time), 
                             format="%d/%m/%Y %H:%M:%S"), tz="UTC")

# Read in the relevant lines, much faster than reading in the whole file
hd <- read.csv2("household_power_consumption.txt", sep = ";", dec='.',
                na.strings = "?", header = TRUE, skip = 66636, nrows = 2880,
                col.name = c('Date','Time','Global_active_power',
                             'Global_reactive_power','Voltage',
                             'Global_intensity','Sub_metering_1',
                             'Sub_metering_2','Sub_metering_3'))

# add a ts column with the POSIXct timestamp
hd$ts <- as.POSIXct(strptime(paste(hd$Date, hd$Time), 
                             format="%d/%m/%Y %H:%M:%S"), tz="UTC")

png(filename = "plot4.png")
par(mfcol = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(hd, {
  plot(Global_active_power ~ ts, type='l', xlab = "",
        ylab = "Global Active Power (kilowatts)",)

  plot(Sub_metering_1 ~ ts, type='n', xlab = "",
        ylab = "Energy sub metering")
  lines(Sub_metering_1 ~ ts)
  lines(Sub_metering_2 ~ ts, col = "red")
  lines(Sub_metering_3 ~ ts, col = "blue")
  legend("topright", pch = ".", lty = c(1,1),
         col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

  plot(Voltage ~ ts, type='l',xlab = "datetime",)

  plot(Global_reactive_power ~ ts, type='l', xlab = "datetime")
})

dev.off()
