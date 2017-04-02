setwd("C:/Users/Corvo/Dropbox/Coursera/Data Science/Module 4/Week 1/Dataset/exdata%2Fdata%2Fhousehold_power_consumption")

# Plot 2 

# Load Data 

head <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "NA")
head$Date <- strptime(head$Date, format = "%d/%m/%Y")
head$Date <- as.Date(head$Date)
head$Global_active_power <- as.numeric(head$Global_active_power)
head.X1 <- head[head$Date >= "2007-02-01" & head$Date <= "2007-02-02", ]
str(head.X1)


# Making Plots 

# Open new plot frame
plot.new()
# Set window size
plot.window(c(0, 480), c(0, 480))
# Open PNG device
png(file = "Plot2.png")
# Create Line Graph
len.x1 <- length(head.X1$Global_active_power)
index.vec <- seq(1, len.x1, 1)
plot(index.vec, head.X1$Global_active_power, type = "l", axes = FALSE, xlab = "", ylab = "Global Active Power (kiloWatts)")
# Add Annotations
xtick <- c(1, len.x1/2, len.x1)
axis(1, at = xtick, labels = c("Thu", "Fri", "Sat"), las = 0)
axis(2)
box(which = "plot", lty = "solid")
# Close PNG device
dev.off()
