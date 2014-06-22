plot22 <- function() {
    # Load the plyr library to use the ddply function
    library(plyr)
    # A constant used later
    athousand <- 1000
    
    # Read the PM summary data - takes time because of large file
    neidata <- readRDS("summarySCC_PM25.rds")
    # Get the data only for Baltimore City
    neidata <- neidata[neidata$fips == "24510",]
    # Create a new data frame with sum of year-wise emissions
    neidf <- ddply(neidata,.(year),summarize,sum=sum(Emissions))
    
    # Create the area for 1x1 plot
    par(mfrow = c(1,1), mar = c(5.1, 4.1, 4.1, 2.1))
    # Change the magnification size of the text and symbols
    par(cex = 1, cex.lab=1, cex.axis=0.75)
    
    # Draw a base plot to show the points of total PM emissions 
    # per year in the data frame
    with(neidf, plot(year, sum/athousand, type="p", pch=5, col="Blue",
                     xaxt="n",
                     xlab="Year",
                     ylab="Total Emissions (thousand tons)",
                     main="Baltimore Total Emissions By Recorded Year"))
    # Customize the x-axis to show only relevant years
    axis(1, c(1999, 2002, 2005, 2008))
    # Draw line through the points to show the movement of numbers
    # from one year to other
    with(neidf, lines(year, sum/athousand))
    
    # Copy the plot to a png device
    dev.copy(png, file="plot22.png")
    # Turn the png device off
    dev.off()
}