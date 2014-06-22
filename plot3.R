plot23 <- function() {
    # Load the plyr library to use the ddply function
    library(plyr)
    # Load the ggplot2 library to draw a ggplot plot
    library(ggplot2)
    
    # Read the PM summary data - takes time because of large file
    neidata <- readRDS("summarySCC_PM25.rds")
    # Get the data only for Baltimore City
    neidata <- neidata[neidata$fips == "24510",]
    # Create a new data frame with sum of emissions by year and type
    neidf <- ddply(neidata,.(year,type),summarize,sum=sum(Emissions))
    
    # Create the initial ggplot variable with required data
    neiplot <- ggplot(data=neidf, aes(x=factor(year), y=sum))
    # Add points to the initial ggplot, and create 4 plots 
    # for different types
    neiplot <- neiplot + geom_point(size=3) + facet_grid(.~type)
    # Add labels and titles to the plots, and change theme
    neiplot <- neiplot + xlab("Year") + 
        ylab("Total Emissions (in tons)") + theme_bw() +
        ggtitle("Baltimore Total Emissions By Recorded Year / Type")
    # Print the ggplot
    print(neiplot)
    
    # Copy the plot to a png device
    dev.copy(png, file="plot23.png")
    # Turn the png device off
    dev.off()
}