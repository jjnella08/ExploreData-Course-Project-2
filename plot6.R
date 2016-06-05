## Course: Exploratory Data Analysis
## Assignment: Course Project 2
## 
## Question6:
## Compare emissions from motor vehicle sources in Baltimore City with emissions 
## from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions? 

setwd("~/Coursera/ExploratoryDataAnalysis")
library(ggplot2)

## Read the data into NEI & SCC data frames.
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

## Collect the subset for Baltimore and Los Angeles data using 'On-Road'
subNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

## Aggregate the total emissions from motor vehicle sources by year and fips
aggSubNEI <- aggregate(Emissions ~ year + fips, data=subNEI, FUN=sum)

## Lable the fips
aggSubNEI$fips[aggSubNEI$fips=="24510"] <- "Baltimore, MD"
aggSubNEI$fips[aggSubNEI$fips=="06037"] <- "Los Angeles, CA"

## Construct the plot and save it to a PNG file.
png("plot6.png",width=480,height=480)

plot6 <- ggplot(aggSubNEI, aes(factor(year), Emissions, fill=year))
plot6 <- plot6 + facet_grid(. ~ fips)
plot6 <- plot6 + geom_bar(stat="identity")  +
  xlab("Year") +
  ylab(expression("Total PM2.5 Emissions")) +
  ggtitle('Total Emissions from Motor Vehicles in Baltimore City, MD vs Los Angeles, CA 1999-2008')

print(plot6)

dev.off()