## Course: Exploratory Data Analysis
## Assignment: Course Project 2
## 
## Question1:
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
## make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

## Read the data into NEI & SCC data frames.
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

# Aggregate the total emissions by year
aggTotals <- aggregate(Emissions ~ year, data=NEI, FUN=sum)

## Construct the plot and save it to a PNG file.
png("plot1.png",width=480,height=480)

barplot((aggTotals$Emissions)/10^6, 
        names.arg=aggTotals$year, 
        main = "Total PM2.5 Emissions by Year", 
        xlab="Year", ylab="PM2.5 Emissions (10^6 Tons)")

dev.off()
