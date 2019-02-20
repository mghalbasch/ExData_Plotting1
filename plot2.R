# This script recreates the second plot for the Exploratory Data Analysis
# Week 1 Project.

library(dplyr)

# First we load in the data:
filename <- "household_power_consumption.txt"
power_data <- read.delim(filename,sep=";", 
                         colClasses = rep("character",9))

# Next we filter for only the dates 2007-02-01 and 2007-02-02.
Feb_data <- filter(power_data, Date == "1/2/2007" |
                     Date == "2/2/2007")


# Now we can make the plot - a plot of global active power over the
# course of these two days.

# We recast the date and time into a POSIXct variable first:
Feb_data <- mutate(Feb_data, 
                   Full_Time = as.POSIXct(paste(Date, Time),
                                          format = "%d/%m/%Y %H:%M:%OS"))

# Now we put our plot into the file 'plot2.png'
png(filename = "plot2.png")

plot(x = Feb_data$Full_Time,
     y = as.numeric(Feb_data$Global_active_power),
     type="l", ylab="Global Active Power (kilowatts)",
     xlab="")

dev.off()
