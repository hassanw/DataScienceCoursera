png(filename = 'plot4.png', width = 480, height = 480, units = 'px')
data = read.table("household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?"); # assumes data file is in same folder
data$Date <- as.Date(data$Date,"%d/%m/%Y")
subData = data[which(data$Date >= as.Date("1/2/2007","%d/%m/%Y") & data$Date <= as.Date("2/2/2007","%d/%m/%Y")),];
subData$Date = as.POSIXct(strptime(paste(as.Date.character(subData$Date),subData$Time),"%Y-%m-%d %H:%M:%S"))
par(mfrow = c(2,2))
plot(subData$Date,subData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

plot(subData$Date,subData$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(subData$Date,subData$Sub_metering_1,type="l",xlab="",ylab="Energy sub Metering",col="black");
lines(subData$Date,subData$Sub_metering_2,type="l",xlab="",ylab="Energy sub Metering",col="red");
lines(subData$Date,subData$Sub_metering_3,type="l",xlab="",ylab="Energy sub Metering",col="blue");
legend("topright", lty = 1, bty = "n", col = c("black","red", "blue"), legend = c("Sub_Metering_1", "Sub_Metering_2","Sub_Metering_3"));

plot(subData$Date,subData$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()