# Load data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

# Strip out the dates 2007-02-01 and 2007-02-02
data.simplified <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# Convert Date to Date class
data.simplified$Date <- as.Date(data.simplified$Date, format="%d/%m/%Y")

# Convert Time to Time class
data.simplified$Time <- strptime(paste(data.simplified$Date, data.simplified$Time), format="%Y-%m-%d %H:%M:%S")

# Plot 2
png(filename = "plot2.png", width = 480, height = 480)

with(data.simplified, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (in kilowatts)"))

dev.off()