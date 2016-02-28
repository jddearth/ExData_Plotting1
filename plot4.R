# Load data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

# Strip out the dates 2007-02-01 and 2007-02-02
data.simplified <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# Convert Date to Date class
data.simplified$Date <- as.Date(data.simplified$Date, format="%d/%m/%Y")

# Convert Time to Time class
data.simplified$Time <- strptime(paste(data.simplified$Date, data.simplified$Time), format="%Y-%m-%d %H:%M:%S")

# Plot 4
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

with(data.simplified, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

with(data.simplified, plot(Time, Voltage, type="l", xlab="datetime", ylab="Voltage"))

plot(data.simplified$Time, data.simplified$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")

lines(data.simplified$Time, data.simplified$Sub_metering_2, col="red")

lines(data.simplified$Time, data.simplified$Sub_metering_3, col="blue")

legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

with(data.simplified, plot(Time, data.simplified$Global_reactive_power, type="l",lwd=0.5, xlab="datetime", ylab="Global_reactive_power"))

dev.off()