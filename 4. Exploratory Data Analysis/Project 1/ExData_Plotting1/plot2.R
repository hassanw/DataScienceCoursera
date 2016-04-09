png(filename = 'plot2.png', width = 480, height = 480, units = 'px')
data = read.table("household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?"); # assumes data file is in same folder
data$Date <- as.Date(data$Date,"%d/%m/%Y")
subData = data[which(data$Date >= as.Date("1/2/2007","%d/%m/%Y") & data$Date <= as.Date("2/2/2007","%d/%m/%Y")),];
subData$Date = as.POSIXct(strptime(paste(as.Date.character(subData$Date),subData$Time),"%Y-%m-%d %H:%M:%S"))
plot(subData$Date,subData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()