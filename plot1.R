################# 
# Title: Exploratory Data Analysis Project 1 Plot 1
# Author: andrewb47
# Date:2014-10-09 
# Purpose: Read the data file to consumption
#          Format the date with 'as.Date' 
#          Format the time with 'times' function of 'chron' package
#          Select the observations of the required two days
#                       2007-02-01 and 2007-02-02 in 'two_days'
#          Make the histogram and write it to a png file
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
# Plot 1 of 'two_days' data
# assign the png file name
png(filename = "plot1.png",)
# histogram plot of Global Active Power with annotations
hist(two_days$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
# close the device and write the png file
dev.off()