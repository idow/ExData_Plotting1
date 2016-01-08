# open a png device
png(filename = "Plot4.png")
# define the plots to be displayed as 2x2
par(mfrow = c(2,2))
# read the table into a variable
powerCon <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# subset the table to the required dates
powerConDates <- powerCon[with(powerCon, powerCon$Date == "1/2/2007" | powerCon$Date == "2/2/2007"), ]
# convert and merge the date and hour
powerConDates$Date <- as.Date(powerConDates$Date, format = "%d/%m/%Y")

powerConDates$Time <-strptime(paste(powerConDates$Date,powerConDates$Time), format="%Y-%m-%d %H:%M:%S")
# plot 1st graph  
plot(powerConDates$Time, as.numeric(as.character(powerConDates$Global_active_power)), 
     ylab = "Global Active Power", type = "l", xlab = "")
# plot 2nd graph  
plot(powerConDates$Time, as.numeric(as.character(powerConDates$Voltage)),
        xlab = "datetimes", ylab = "Voltage", type = "l")
# plot 3rd graph
plot(powerConDates$Time, as.numeric(as.character(powerConDates$Sub_metering_1)), type = "l", 
     ylab = "Energy sub metering", xlab = "")

lines(powerConDates$Time, as.numeric(as.character(powerConDates$Sub_metering_3)), col = "blue")
lines(powerConDates$Time, as.numeric(as.character(powerConDates$Sub_metering_2)), col = "red")

legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
# plot 4th graph
plot(powerConDates$Time, as.numeric(as.character(powerConDates$Global_reactive_power)),
       xlab = "datetimes", ylab = "Global_reactive_power", type = "l")
# close device to create the png file
dev.off()