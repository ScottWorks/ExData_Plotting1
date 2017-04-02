setwd("C:/Users/Corvo/Dropbox/Coursera/Data Science/Module 4/Week 1/Dataset/exdata%2Fdata%2Fhousehold_power_consumption")

# Plot 1 

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
plot.window(c(0, 480), c(480, 0))
# Open PNG device
png(file = "Plot1.png")
# Create Histogram
hist(head.X1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kiloWatts)", ylab = "Frequency")
# Close PNG device 
dev.off()
