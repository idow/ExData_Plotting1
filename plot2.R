
png(filename = "Plot2.png")
  
powerCon <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

powerConDates <- powerCon[with(powerCon, powerCon$Date == "1/2/2007" | powerCon$Date == "2/2/2007"), ]

powerConDates$Date <- as.Date(powerConDates$Date, format = "%d/%m/%Y")

powerConDates$Time <-strptime(paste(powerConDates$Date,powerConDates$Time), format="%Y-%m-%d %H:%M:%S")
  
plot(powerConDates$Time, as.numeric(as.character(powerConDates$Global_active_power)), 
       ylab = "Global Active Power (killowatts)", type = "l", xlab = "")
  
dev.off()