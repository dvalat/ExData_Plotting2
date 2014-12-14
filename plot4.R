# COURSERA
# Exploratory Data Analysis - Course Project 2
# Author: VALAT Didier
# Last update: December 13, 2014

# Read the data from the "RDS" files
neiData <- readRDS("summarySCC_PM25.rds")
sccData <- readRDS("Source_Classification_Code.rds")

# Create the PNG file using the same parameters as Course Project 1
png(filename = "plot4.png", 
    width = 480, height = 480, 
    units = "px")

# Extract the lines related to "coal" from SCC dataset
sccDataCoal <- grep("coal", sccData$Short.Name, ignore.case = T)
sccDataCoal <- sccData[sccDataCoal,]
# Apply the extraction the NEI dataset
neiDataCoal <- neiData[neiData$SCC %in% sccDataCoal$SCC, ]

# Apply "sum" aggregation to the data (Total Emissions from coal combustion by year)
totalEmissionsCoalByYear <- aggregate(neiDataCoal$Emissions, list(neiDataCoal$year), FUN = "sum")

# Generate the plot using base plotting system
plot(totalEmissionsCoalByYear, type = "l", xlab = "Year", 
     main = "Total Emissions from coal combustion-related\n sources from 1999 to 2008", 
     ylab = expression("Total PM"[2.5]*" Emissions"))

# Shutdown the device
dev.off()