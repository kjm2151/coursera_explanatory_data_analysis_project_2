## Question 3

############INSTALL GGPLOT####################
# The easiest way to get ggplot2 is to install the whole tidyverse:
install.packages("tidyverse")

library(ggplot2)
##################################################

## Import Data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

## Data manipulation
## CREATE SUBSET
SUBSETNEI <- subset(NEI, fips == "24510", select=c(Emissions, type, year)) 

aggregatedbyyear_bulti <- aggregate(Emissions ~ year + type, SUBSETNEI, sum)


## Data Visualization Plot 3

g <- ggplot(aggregatedbyyear_bulti, aes(year, Emissions, color = type))
g <- g + geom_line() +
        xlab("Year") +
        ylab(expression("Total Emissions")) +
        ggtitle("Total PM2.5 emission by year in Baltimore from 1999 to 2008")
plot(g)


## Output Plot 3
dev.copy(png, file="plot3.png")
dev.off()
