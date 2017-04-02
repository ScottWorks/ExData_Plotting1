setwd("C:/Users/Corvo/Dropbox/Coursera/Data Science/Module 4/Week 1/Dataset/exdata%2Fdata%2Fhousehold_power_consumption")

# Plot 2 

# Load Data 

head <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "NA")
head$Date <- strptime(head$Date, format = "%d/%m/%Y")
head$Date <- as.Date(head$Date)
head$Global_active_power <- as.numeric(head$Global_active_power)
head$Sub_metering_1 <- as.numeric(head$Sub_metering_1)
head$Sub_metering_2 <- as.numeric(head$Sub_metering_2)
head$Sub_metering_3 <- as.numeric(head$Sub_metering_3)
head.X1 <- head[head$Date >= "2007-02-01" & head$Date <= "2007-02-02", ]
str(head.X1)


# Making Plots 

# Open new plot frame
plot.new()
# Set window size
plot.window(c(0, 480), c(0, 480))
# Open PNG device
png(file = "Plot4.png")

# Create 2 by 2 vector for plots
par(mfrow = c(2,2))

# Create "Global Active Power" Graph
len.x1 <- length(head.X1$Global_active_power)
index.vec <- seq(1, len.x1, 1)
plot(index.vec, head.X1$Global_active_power, type = "l", axes = FALSE, xlab = "", ylab = "Global Active Power (kiloWatts)")
# Add Annotations
xtick <- c(1, len.x1/2, len.x1)
axis(1, at = xtick, labels = c("Thu", "Fri", "Sat"), las = 0)
axis(2)
box(which = "plot", lty = "solid")

# Create "Voltage" Graph
len.x1 <- length(head.X1$Global_active_power)
index.vec <- seq(1, len.x1, 1)
plot(index.vec, head.X1$Voltage, type = "l", axes = FALSE, xlab = "", ylab = "Voltage")
# Add Annotations
xtick <- c(1, len.x1/2, len.x1)
axis(1, at = xtick, labels = c("Thu", "Fri", "Sat"), las = 0)
axis(2)
box(which = "plot", lty = "solid")

# Create "Sub-Metering" Graph
len.x1 <- length(head.X1$Global_active_power)
index.vec <- seq(1, len.x1, 1)
plot(index.vec, head.X1$Sub_metering_1, type = "l", axes = FALSE, xlab = "", ylab = "Energy Sub-Metering")
# lines(index.vec, head$Sub_metering_1, col = "black")
lines(index.vec, head.X1$Sub_metering_2, col = "red")
lines(index.vec, head.X1$Sub_metering_3, col = "blue")
# Add Annotations
legend("topright", cex = 1, c("Sub-Metering 1","Sub-Metering 2","Sub-Metering 3"), horiz = FALSE, col=c("black", "red","blue"), lty = c(1,1,1), lwd = c(2,2,2), bty = "n")
xtick <- c(1, len.x1/2, len.x1)
axis(1, at = xtick, labels = c("Thu", "Fri", "Sat"), las = 0)
axis(2)
box(which = "plot", lty = "solid")

# Create "Global Reactive Power" Graph
len.x1 <- length(head.X1$Global_active_power)
index.vec <- seq(1, len.x1, 1)
plot(index.vec, head.X1$Global_reactive_power, type = "l", axes = FALSE, xlab = "", ylab = "Global Reactive Power (kiloWatts)")
# Add Annotations
xtick <- c(1, len.x1/2, len.x1)
axis(1, at = xtick, labels = c("Thu", "Fri", "Sat"), las = 0)
axis(2)
box(which = "plot", lty = "solid")

# Close PNG device
dev.off()
