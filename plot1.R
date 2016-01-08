# open a png device
png(filename = "Plot1.png")
# read the table into a variable
powerCon <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# subset the table to the required dates
powerConDates <- powerCon[with(powerCon, powerCon$Date == "1/2/2007" | powerCon$Date == "2/2/2007"), ]
# plot the histogram of global active power
hist(as.numeric(as.character(powerConDates$Global_active_power)), col = "red",
       xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  
# close device to create the png file
dev.off()