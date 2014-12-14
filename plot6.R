# COURSERA
# Exploratory Data Analysis - Course Project 2
# Author: VALAT Didier
# Last update: December 13, 2014

# Read the data from the "RDS" files
neiData <- readRDS("summarySCC_PM25.rds")
sccData <- readRDS("Source_Classification_Code.rds")

# Subset the dataset to select only the data related to Baltimore City and Los Angeles County
neiData <- neiData[neiData$fips == "24510" | neiData$fips == "06037",] 

# Load and attach "ggplot2" package
library(ggplot2)

# Extract the lines related to "motor" from SCC dataset
sccDataMotor <- grep("motor", sccData$Short.Name, ignore.case = T)
sccDataMotor <- sccData[sccDataMotor,]
# Apply the extraction the NEI dataset
neiDataMotor <- neiData[neiData$SCC %in% sccDataMotor$SCC, ]

# Generate the plot using "ggplot" and selecting "fips" as aesthetic data variable
g <- ggplot(neiDataMotor, aes(year, Emissions, color = fips))

# Connect the observations, aggregate the data with "sum", add main, y-axis label and scale by city names
g <- g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore")) +
  ggtitle("Comparison of Total Emissions From Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County from 1999 to 2008")

# Create the PNG file using the same parameters as Course Project 1
png(filename = "plot6.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")

# Add the plot
print(g)

# Shutdown the device
dev.off()