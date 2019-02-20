# This script recreates the third plot for the Exploratory Data Analysis
# Week 1 Project.

library(dplyr)

# First we load in the data:
filename <- "household_power_consumption.txt"
power_data <- read.delim(filename,sep=";", 
                         colClasses = rep("character",9))

# Next we filter for only the dates 2007-02-01 and 2007-02-02.
Feb_data <- filter(power_data, Date == "1/2/2007" |
                     Date == "2/2/2007")


# Now we can make the plot - this one plots 3 different kinds of
# sub-metering over the course of the three days.

# We recast the date and time into a POSIXct variable first:
Feb_data <- mutate(Feb_data, 
                   Full_Time = as.POSIXct(paste(Date, Time),
                                          format = "%d/%m/%Y %H:%M:%OS"))

# Now we put our plot into the file 'plot3.png'
png(filename = "plot3.png")

plot(x = Feb_data$Full_Time,
     y = as.numeric(Feb_data$Sub_metering_1),
     type="l", ylab="Energy sub metering",
     xlab="",
     col = 'black')

lines(x = Feb_data$Full_Time,
     y = as.numeric(Feb_data$Sub_metering_2),
     type="l", col = 'red')

lines(x = Feb_data$Full_Time,
     y = as.numeric(Feb_data$Sub_metering_3),
     type="l", col = 'blue')

legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       lty=1,
       col=c("black","red","blue"))


dev.off()
