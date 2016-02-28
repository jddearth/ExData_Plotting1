# Load data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

# Strip out the dates 2007-02-01 and 2007-02-02
data.simplified <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# Convert Date to Date class
data.simplified$Date <- as.Date(data.simplified$Date, format="%d/%m/%Y")

# Convert Time to Time class
data.simplified$Time <- strptime(paste(data.simplified$Date, data.simplified$Time), format="%Y-%m-%d %H:%M:%S")

# Plot 3
png(filename = "plot3.png", width = 480, height = 480)

plot(data.simplified$Time, data.simplified$Sub_metering_1, type="l", ylab="Energy sub metering")

lines(data.simplified$Time, data.simplified$Sub_metering_2, col="red")

lines(data.simplified$Time, data.simplified$Sub_metering_3, col="blue")

legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

dev.off()