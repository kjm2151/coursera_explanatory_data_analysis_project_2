## Question 6

## Import Data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

## Data manipulation
SUBSETNEI2 <- subset(NEI, fips%in%c("24510","06037") & type == "ON-ROAD", )

AGGR_BY_YEAR_CITY_EMISSIONS <- aggregate(Emissions ~ year + fips, SUBSETNEI2, sum)
AGGR_BY_YEAR_CITY_EMISSIONS$fips[AGGR_BY_YEAR_CITY_EMISSIONS$fips=="24510"] <- "Baltimore City"
AGGR_BY_YEAR_CITY_EMISSIONS$fips[AGGR_BY_YEAR_CITY_EMISSIONS$fips=="06037"] <- "Los Angeles County"


## Data Visualization Plot 6
library(ggplot2)


g <- ggplot(AGGR_BY_YEAR_CITY_EMISSIONS, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
        xlab("Year") +
        ylab(expression("Motor Emissions")) +
        ggtitle("Emissions from Motor comparison (Baltimore vs LA)")

plot(g)


## Output Plot 6
dev.copy(png, file="plot6.png")
dev.off()
