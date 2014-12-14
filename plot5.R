# COURSERA
# Exploratory Data Analysis - Course Project 2
# Author: VALAT Didier
# Last update: December 13, 2014

# Read the data from the "RDS" files
neiData <- readRDS("summarySCC_PM25.rds")
sccData <- readRDS("Source_Classification_Code.rds")

# Create the PNG file using the same parameters as Course Project 1
png(filename = "plot5.png", 
    width = 480, height = 480, 
    units = "px")

# Subset the dataset to select only the data related to Baltimore City
neiData <- neiData[neiData$fips == "24510",] 

# Extract the lines related to "motor" from SCC dataset
sccDataMotor <- grep("motor", sccData$Short.Name, ignore.case = T)
sccDataMotor <- sccData[sccDataMotor,]
# Apply the extraction the NEI dataset
neiDataMotor <- neiData[neiData$SCC %in% sccDataMotor$SCC, ]

# Apply "sum" aggregation to the data (Total Emissions from motor vehicle in Baltimore City by year)
totalEmissionsMotorByYear <- aggregate(neiDataMotor$Emissions, list(neiDataMotor$year), FUN = "sum")

# Generate the plot using base plotting system
plot(totalEmissionsMotorByYear, type = "l", xlab = "Year", 
     main = "Total Emissions from motor vehicle sources\n from 1999 to 2008 in Baltimore City", 
     ylab = expression("Total PM"[2.5]*" Emissions"))

# Shutdown the device
dev.off()