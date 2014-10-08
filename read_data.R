################# 
# Title: Exploratory Data Analysis Project 2 Plot **
# Author: andrewb47
# Date:2014-10-07 
# Purpose: Read the data file to consumption
#          
#          
#          
#          
#################
#
#
# initial <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
#                      na.strings = "?", nrows = 100, comment.char = "")

classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric",
             "numeric", "numeric")
consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                          na.strings = "?", colClasses = classes, comment.char = "")
my_date <- "%d/%m/%Y"
consumption$Date <- as.Date(consumption$Date, format = my_date)
#
my_time <- "%H:%M:%S"
consumption$Time <- as.POSIXct(consumption$Time, format = my_time)

