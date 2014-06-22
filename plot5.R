plot5 <- function() {
    # Load the plyr library to use the ddply function
    library(plyr)

    # Read the PM summary data - takes time because of large file
    neidata <- readRDS("summarySCC_PM25.rds")
    # Read the source classification code table
    sccdata <- readRDS("Source_Classification_Code.rds")
    # Get the data only for Baltimore City
    neidata <- neidata[neidata$fips == "24510",]
    # Get only Motor Vehicle sources
    sccdata <- sccdata[grep("Mobile - On-Road", sccdata$EI.Sector, 
                            ignore.case = TRUE),]
    # Merge the Baltimore PM summary data with filtered source code data
    neisccdata <- merge(neidata, sccdata, by="SCC", all=FALSE)
    # Create a new data frame with sum of year-wise emissions
    # for Motor Vehicle sources in Baltimore City
    neisccdf <- ddply(neisccdata,.(year),summarize,sum=sum(Emissions))

    # Create the area for 1x1 plot
    par(mfrow = c(1,1), mar = c(5.1, 4.1, 4.1, 2.1))
    # Change the magnification size of the text and symbols
    par(cex = 1, cex.lab=1, cex.axis=0.75)

    # Draw a base plot to show the points of total PM emissions 
    # for motor vehicle sources in Baltimore city per year
    with(neisccdf, plot(year, sum, type="p", pch=5, col="Blue",
                        xaxt="n",
                        xlab="Year",
                        ylab="Total Emissions (in tons)",
                        main="Total Emissions By Recorded Year for Motor \n Vehicle Sources Only in Baltimore City"))
    # Customize the x-axis to show only relevant years
    axis(1, c(1999, 2002, 2005, 2008))
    # Draw line through the points to show the movement of numbers
    # from one year to other
    with(neisccdf, lines(year, sum))

    # Copy the plot to a png device
    dev.copy(png, file="plot5.png")
    # Turn the png device off
    dev.off()
}
