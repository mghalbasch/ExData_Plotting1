# This script recreates the fourth plot for the Exploratory Data Analysis
# Week 1 Project.

library(dplyr)

# First we load in the data:
filename <- "household_power_consumption.txt"
power_data <- read.delim(filename,sep=";", 
                         colClasses = rep("character",9))

# Next we filter for only the dates 2007-02-01 and 2007-02-02.
Feb_data <- filter(power_data, Date == "1/2/2007" |
                     Date == "2/2/2007")


# Now we can make the plot: plot 4 is actually four plots, two of
# which were created in plot2.R and plot3.R. We copy the code from
# those two files for these plots.

# The remaining plots are Voltage against time, and Global reactive
# power against time.

# We recast the date and time into a POSIXct variable first:
Feb_data <- mutate(Feb_data, 
                   Full_Time = as.POSIXct(paste(Date, Time),
                                          format = "%d/%m/%Y %H:%M:%OS"))

# Now we are ready to make the four plots, and place them into 'plot4.png'
png(filename = "plot4.png")

par(mfcol=c(2,2))

# First we make the Global Active Power plot
plot(x = Feb_data$Full_Time,
     y = as.numeric(Feb_data$Global_active_power),
     type="l", ylab="Global Active Power (kilowatts)",
     xlab="")

# Next we make the sub-metering plot

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

# Next we make the Voltage plot
plot(x = Feb_data$Full_Time,
     y = as.numeric(Feb_data$Voltage),
     type="l", ylab="Voltage",
     xlab="datetime")

# Finally we make the Global reactive power plot
plot(x = Feb_data$Full_Time,
     y= as.numeric(Feb_data$Global_reactive_power),
     type="l", ylab = "Global_reactive_power",
     xlab="datetime")


dev.off()
