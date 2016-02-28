# Load data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

# Strip out the dates 2007-02-01 and 2007-02-02
data.simplified <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# Convert Date to Date class
data.simplified$Date <- as.Date(data.simplified$Date, format="%d/%m/%Y")

# Convert Time to Time class
data.simplified$Time <- strptime(paste(data.simplified$Date, data.simplified$Time), format="%Y-%m-%d %H:%M:%S")

# Plot 1
png(filename = "plot1.png", width = 480, height = 480)

with(data.simplified, hist(Global_active_power, col="red", breaks=15, xlab="Global Active Power (kilowatts)", main="Global Active Power", ylim=c(0,1200)))

dev.off()