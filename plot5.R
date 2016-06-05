## Course: Exploratory Data Analysis
## Assignment: Course Project 2
## 
## Question5:
## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 

setwd("~/Coursera/ExploratoryDataAnalysis")
library(ggplot2)

## Read the data into NEI & SCC data frames.
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

## Collect the subset for Baltimore data using 'On-Road'
subNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

## Aggregate the total emissions from motor vehicle sources by year
aggSubNEI <- aggregate(Emissions ~ year, data=subNEI, FUN=sum)

## Construct the plot and save it to a PNG file.
png("plot5.png",width=480,height=480)

plot5 <- ggplot(aggSubNEI, aes(factor(year), Emissions,fill=year))
plot5 <- plot5 + geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression("Total PM2.5 Emissions")) +
  ggtitle('Motor Vehicle Source Emissions in Baltimore from 1999-2008')

print(plot5)

dev.off()
