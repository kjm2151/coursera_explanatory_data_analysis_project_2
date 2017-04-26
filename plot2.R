## Question 2

## Import Data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

## Data manipulation
## CREATE SUBSET
SUBSETNEI <- subset(NEI, fips == "24510", select=c(Emissions,year)) 
aggregatedbyyear_bulti <- aggregate(SUBSETNEI$Emissions, by = list(Year = SUBSETNEI$year), FUN = sum)

## Data Visualization Plot 2
colnames(aggregatedbyyear_bulti) <- c("Year", "Total Emissions")
plot(aggregatedbyyear_bulti)
title(main="Total PM2.5 emission by year in Baltimore")
abline(lm(`Total Emissions` ~ Year, data=aggregatedbyyear_bulti), col="red")


## Output Plot 2
dev.copy(png, file="plot2.png")
dev.off()
