## Course: Exploratory Data Analysis
## Assignment: Course Project 2
## 
## Question3:
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
## which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
## Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make 
## a plot answer this question.

setwd("~/Coursera/ExploratoryDataAnalysis")
library(ggplot2)

## Read the data into NEI & SCC data frames.
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

## Subset Baltimore data
BaltNEI <- subset(NEI, NEI$fips==24510)

## Aggregate the total emissions for Baltimore grouped by type and year
aggTotalsBalt <- aggregate(Emissions ~ year + type, data=BaltNEI, FUN=sum)

## Construct the plot and save it to a PNG file.
png("plot3.png",width=480,height=480)

plot3 <- ggplot(aggTotalsBalt, aes(year, Emissions, color = type))
plot3 <- plot3 + geom_line() + xlab("Year") + ylab("Total PM2.5 Emissions") +
  ggtitle('Total Emissions in Baltimore City from 1999 to 2008')
print(plot3)
  
dev.off()