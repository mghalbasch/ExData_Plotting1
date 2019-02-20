# This script recreates the first plot for the Exploratory Data Analysis
# Week 1 Project.

library(dplyr)

# First we load in the data:
filename <- "household_power_consumption.txt"
power_data <- read.delim(filename,sep=";", 
                         colClasses = rep("character",9))

# Next we filter for only the dates 2007-02-01 and 2007-02-02.
Feb_data <- filter(power_data, Date == "1/2/2007" |
                               Date == "2/2/2007")

# Now we can make the plot - a histogram of global active power.

png(filename = "plot1.png", width=480, height=480)

hist(as.numeric(Feb_data$Global_active_power), breaks = 12,
     xlab="Global Active Power (kilowatts)", ylab="Frequency",
     main="Global Active Power", col = "red")

dev.off()
