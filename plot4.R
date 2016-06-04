## Course: Exploratory Data Analysis
## Assignment: Course Project 2
## 
## Question4:
## Across the United States, how have emissions from coal 
## combustion-related sources changed from 1999-2008

setwd("~/Coursera/ExploratoryDataAnalysis")
library(ggplot2)

## Read the data into NEI & SCC data frames.
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

# merge the NEI and SCC sets by SCC code
NEISCC <- merge(NEI, SCC, by="SCC")

## Collect all NEIxSCC records with Short.Name Coal
coalNEISCC  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subCoalNEISCC <- NEISCC[coalNEISCC, ]

## Aggregate the total emissions from coal combustion-related sources by year
aggCoalNEISCC <- aggregate(Emissions ~ year, data=subCoalNEISCC, FUN=sum)

## Construct the plot and save it to a PNG file.
png("plot4.png",width=480,height=480)

plot4 <- ggplot(aggCoalNEISCC, aes(factor(year), Emissions/10^5,fill=year))
plot4 <- plot4 + geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression("Total PM2.5 Emissions (10^5 Tons)")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')

print(plot4)

dev.off()