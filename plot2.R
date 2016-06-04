## Course: Exploratory Data Analysis
## Assignment: Course Project 2
## 
## Question2:
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## Read the data into NEI & SCC data frames.
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

## Subset Baltimore data
BaltNEI <- subset(NEI, NEI$fips==24510)

## Aggregate the total emissions for Baltimore by year
aggTotalsBalt <- aggregate(Emissions ~ year, data=BaltNEI, FUN=sum)

## Construct the plot and save it to a PNG file.
png("plot2.png",width=480,height=480)

barplot(aggTotalsBalt$Emissions, 
        names.arg=aggTotalsBalt$year, 
        main = "Total PM2.5 Emissions From all Baltimore City Sources", 
        xlab="Year", ylab="PM2.5 Emissions")

dev.off()
