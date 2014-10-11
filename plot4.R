################# 
# Title: Exploratory Data Analysis Project 1 Plot 4
# Author: andrewb47
# Date:2014-10-11 
# Purpose: Read the data file to 'consumption'
#          Format the date with 'as.Date' 
#          Format the time with 'times' function of 'chron' package
#          Select the observations of the required two days
#                       2007-02-01 and 2007-02-02 in 'two_days'
#          Make the four plots and write them to a png file
#################
#
library(chron)  # used for tidying the 'time' column
# specify the classes of the columns to speed up the read
classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric",
             "numeric", "numeric")
consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                          na.strings = "?", colClasses = classes, 
                          comment.char = "")
#
# convert the date from character to date class
my_date <- "%d/%m/%Y"
consumption$Date <- as.Date(consumption$Date, format = my_date)
#
# convert the time from charater to time class (without the date prepended)
consumption$Time <- times(consumption$Time, format = "h:m:s")
#
# select the required two days
two_days <- subset(consumption, consumption$Date == "2007-02-01" 
                   | consumption$Date == "2007-02-02")
#
# free up memory by removing the 'consumption' table, etc
rm(consumption, classes, my_date)
#
#
# Plot 4
#
png(filename = "plot4.png")           #assign the plot filename 
par(mar = c(5, 4, 4, 2),
    mfrow = c(2, 2)) # layout of plots
#
# plot4.1
#
par(xaxt="n" )                          # disable default x axis scale
plot(two_days$Global_active_power, type = "l",
     xlab = "",                         # disable default x axis label
     ylab = "Global Active Power",
)
#
par(xaxt="s")                           # enable x axis scale
#                                       # specify x axis scale
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
#
# plot4.2
#
par(xaxt="n" )                          # disable default x axis scale
plot(two_days$Voltage, type = "l",
     xlab = "datetime",                    
     ylab = "Voltage",
)
#
par(xaxt="s")                           # enable x axis scale
#                                       # specify x axis scale
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
#
#
# Plot 4_3
# 
par(xaxt="n" )                          # disable default x axis scale
with(two_days, plot(Sub_metering_1, 
                    type = "l",
                    xlab = "",          # disable default x axis label
                    ylab = "Energy sub metering"
))
with(two_days, lines(Sub_metering_2, 
                     type = "l",
                     col = "red"))
with(two_days, lines(Sub_metering_3, 
                     type = "l",
                     col = "blue"))
#
par(xaxt="s")                           # enable x axis scale
#                                       # specify x axis scale
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
#
legend("topright", 
       pch = "—",                       # dash character - "l" was vertical
       bty = "n",                       # no legend box
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)
#
# plot4.4
#
# 
par(xaxt="n" )                          # disable default x axis scale
plot(two_days$Global_reactive_power, type = "l",
     xlab = "datetime",                       
     ylab = "Global_reactive_power",
)
#
par(xaxt="s")                           # enable x axis scale
#                                       # specify x axis scale
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
#
dev.off()                               # write the plot file
#