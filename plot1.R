
png(filename = "Plot1.png")
  
powerCon <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  
powerConDates <- powerCon[with(powerCon, powerCon$Date == "1/2/2007" | powerCon$Date == "2/2/2007"), ]
  
hist(as.numeric(as.character(powerConDates$Global_active_power)), col = "red",
       xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  

dev.off()