## Question 5

## Import Data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

## Data manipulation
SUBSETNEI <- subset(NEI, fips == "24510" & NEI$type=="ON-ROAD", ) 

BAL_AGGR_BY_YEAR <- aggregate(Emissions ~ year, SUBSETNEI, sum)



## Data Visualization Plot 5

library(ggplot2)

g <- ggplot(BAL_AGGR_BY_YEAR, aes(year, Emissions))
g <- g + geom_line() +
        xlab("Year") +
        ylab(expression("Total Emissions")) +
        ggtitle("Emissions from Motors in Baltimore City by year")
plot(g)

## Output Plot 5
dev.copy(png, file="plot5.png")
dev.off()
