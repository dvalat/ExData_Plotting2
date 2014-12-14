# COURSERA
# Exploratory Data Analysis - Course Project 2
# Author: VALAT Didier
# Last update: December 13, 2014

# Read the data from the "RDS" files
neiData <- readRDS("summarySCC_PM25.rds")
sccData <- readRDS("Source_Classification_Code.rds")

# Subset the dataset to select only the data related to Baltimore City
neiData <- neiData[neiData$fips == "24510",] 

# Create the PNG file using the same parameters as Course Project 1
png(filename = "plot2.png", 
    width = 480, height = 480, 
    units = "px")

# Apply "sum" aggregation to the data  (Total Emissions by year)
totalEmissionsByYear <- aggregate(neiData$Emissions, list(neiData$year), FUN = "sum")

# Generate the plot using base plotting system
plot(totalEmissionsByYear, type = "l", xlab = "Year", 
     main = "Total Emissions in Baltimore City from 1999 to 2008", 
     ylab = expression("Total PM"[2.5]*" Emissions"))

# Shutdown the device
dev.off()