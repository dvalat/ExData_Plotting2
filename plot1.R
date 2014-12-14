# COURSERA
# Exploratory Data Analysis - Course Project 1
# Author: VALAT Didier
# Last update: December 16, 2014

# Read the data from the ".txt" file and specify the NA values with "?"
hhpc_data <- read.table("household_power_consumption.txt",header=T,sep=";",as.is=T,na.strings="?")
# Convert the dates into the correct format
hhpc_data$Date <- as.Date(hhpc_data$Date,"%d/%m/%Y")
# Select only the data from the dates "2007-02-01" and "2007-02-02"
hhpc_data <- hhpc_data[hhpc_data$Date=='2007-02-01' | hhpc_data$Date=='2007-02-02',]
# Convert variables into numeric
for(i in 3:9) hhpc_data[,i] <- as.numeric(hhpc_data[,i])

# Create the PNG file
png(filename = "plot1.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
# Generate the plot
with(hhpc_data,hist(Global_active_power,main="Global Active Power",col='red',xlab='Global Active Power (kilowatts)'))
# Close the PNG file
dev.off()