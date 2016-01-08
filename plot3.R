
png(filename = "Plot3.png")
  
powerCon <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

powerConDates <- powerCon[with(powerCon, powerCon$Date == "1/2/2007" | powerCon$Date == "2/2/2007"), ]

powerConDates$Date <- as.Date(powerConDates$Date, format = "%d/%m/%Y")

powerConDates$Time <-strptime(paste(powerConDates$Date,powerConDates$Time), format="%Y-%m-%d %H:%M:%S")

plot(powerConDates$Time, as.numeric(as.character(powerConDates$Sub_metering_1)), type = "l", 
       ylab = "Energy sub metering", xlab = "")

lines(powerConDates$Time, as.numeric(as.character(powerConDates$Sub_metering_3)), col = "blue")
lines(powerConDates$Time, as.numeric(as.character(powerConDates$Sub_metering_2)), col = "red")

legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()  
  
