## Question 4

## Import Data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")


library(ggplot2)

NEISCC <- merge(NEI, SCC, by="SCC")


## Data manipulation
## CREATE SUBSET
# Retrun NEI, SCC records with Short.Name (SCC) Coal
COAL <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
SUBSETNEISCC <- NEISCC[COAL, ]

aggbyyear<- aggregate(Emissions ~ year, SUBSETNEISCC, sum)

## Data Visualization Plot 4
colnames(aggbyyear) <- c("Year", "Total Emissions")
plot(aggbyyear)
title(main = "Coal Emissions in the USA")
abline(lm(`Total Emissions` ~ Year, data=aggbyyear), col="red")

## Output Plot 4
dev.copy(png, file="plot4.png")
dev.off()
