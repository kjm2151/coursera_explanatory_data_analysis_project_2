## Courera Exploratory Data Analysis Course Project2
## Question 1

## Import Data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")


## Data manipulation
aggregatedbyyear <- aggregate(NEI$Emissions, by = list(Year = NEI$year), FUN = sum)
colnames(aggregatedbyyear) <- c("Year", "Total Emissions")

## Data Visualization Plot 1
plot(aggregatedbyyear)
title(main = "Total PM2.5 emission by year")
abline(lm(`Total Emissions` ~ Year, data=aggregatedbyyear), col="red")

## Output Plot 1
dev.copy(png, file="plot1.png")
dev.off()
