plot1 <- function() {
    # Load the plyr library to use the ddply function
    library(plyr)
    # A constant used later
    amillion <- 1000000
    
    # Read the PM summary data - takes time because of large file
    neidata <- readRDS("summarySCC_PM25.rds")
    # Create a new data frame with sum of year-wise emissions
    neidf <- ddply(neidata,.(year),summarize,sum=sum(Emissions))
    
    # Create the area for 1x1 plot
    par(mfrow = c(1,1), mar = c(5.1, 4.1, 4.1, 2.1))
    # Change the magnification size of the text and symbols
    par(cex = 1, cex.lab=1, cex.axis=0.75)
    
    # Draw a base plot to show the points of total PM emissions 
    # per year in the data frame
    with(neidf, plot(year, sum/amillion, type="p", pch=5, col="Red",
                     xaxt="n",
                     xlab="Year",
                     ylab="Total Emissions (million tons)",
                     main="Overall Total Emissions By Recorded Year"))
    # Customize the x-axis to show only relevant years
    axis(1, c(1999, 2002, 2005, 2008))
    # Draw line through the points to show the movement of numbers
    # from one year to other
    with(neidf, lines(year, sum/amillion))
    
    # Copy the plot to a png device
    dev.copy(png, file="plot1.png")
    # Turn the png device off
    dev.off()
}
