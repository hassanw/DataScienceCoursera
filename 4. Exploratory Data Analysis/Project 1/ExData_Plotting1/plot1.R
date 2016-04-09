png(filename = 'plot1.png', width = 480, height = 480, units = 'px')
data = read.table("household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?"); # assumes data file is in same folder
data$Date <- as.Date(data$Date,"%d/%m/%Y")
subData = data[which(data$Date >= as.Date("1/2/2007","%d/%m/%Y") & data$Date <= as.Date("2/2/2007","%d/%m/%Y")),];
hist(subData$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col = "red")
dev.off()