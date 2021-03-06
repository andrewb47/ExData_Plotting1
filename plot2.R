################# 
# Title: Exploratory Data Analysis Project 1 Plot 2
# Author: andrewb47
# Date:2014-10-11 
# Purpose: Read the data file to 'consumption'
#          Format the date with 'as.Date' 
#          Format the time with 'times' function of 'chron' package
#          Select the observations of the required two days
#                       2007-02-01 and 2007-02-02 in 'two_days'
#          Make the line plot and write it to a png file
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
# Plot2 
# assign the png file name
png(filename = "plot2.png",)
# 
par(xaxt="n" )                          # disable default x axis scale
plot(two_days$Global_active_power, type = "l",
     xlab = "",                         # disable default x axis label
     ylab = "Global Active Power (kilowatts)",
     )
#
par(xaxt="s")                           # enable x axis scale
#                                       # specify x axis scale
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
#
# close the device and write the png file
dev.off()
#
