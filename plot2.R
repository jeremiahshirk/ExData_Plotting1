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

png(filename = "plot2.png")
with(hd, plot(Global_active_power ~ ts, type='l',
              xlab = "",
              ylab = "Global Active Power (kilowatts)",
              )
     )
dev.off()
