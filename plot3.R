# COURSERA
# Exploratory Data Analysis - Course Project 2
# Author: VALAT Didier
# Last update: December 13, 2014

# Read the data from the "RDS" files
neiData <- readRDS("summarySCC_PM25.rds")
sccData <- readRDS("Source_Classification_Code.rds")

# Subset the dataset to select only the data related to Baltimore City
neiData <- neiData[neiData$fips == "24510",] 

# Load and attach "ggplot2" package
library(ggplot2)

# Generate the plot using "ggplot" and selecting "type" as aesthetic data variable
g <- ggplot(neiData, aes(year, Emissions, color = type))

# Connect the observations, aggregate the data with "sum", add main and y-axis label
g <- g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")

# Create the PNG file using the same parameters as Course Project 1
png(filename = "plot3.png", 
    width = 480, height = 480, 
    units = "px")

# Add the plot
print(g)

# Shutdown the device
dev.off()