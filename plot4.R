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
png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
# Define the number of plots per row, column (plots are filled row-wise)
par(mfrow=c(2,2))
# Generate the first plot
with(hhpc_data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
               ,Global_active_power,type='l',xlab=NA,ylab='Global Active Power'))
# Generate the second plot
with(hhpc_data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
                      ,Voltage,type='l',xlab='datetime',ylab='Voltage'))
# Generate the third plot
with(hhpc_data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
                      ,Sub_metering_1,type='l',xlab=NA,ylab='Energy sub metering'))
with(hhpc_data,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
                      ,Sub_metering_2,col='red'))
with(hhpc_data,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
                      ,Sub_metering_3,col='blue'))
# Add the legend to the third plot
legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
       ,col=c('black','red','blue'),lwd=1,bty="n")
# Generate the fourth plot
with(hhpc_data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
                      ,Global_reactive_power,type='l',xlab='datetime',ylab='Global_reactive_power'))
# Close the PNG file
dev.off()