plot6 <- function() {
    
    # Read the PM summary data - takes time because of large file
    neidata <- readRDS("summarySCC_PM25.rds")
    # Read the source classification code table
    sccdata <- readRDS("Source_Classification_Code.rds")
    # Get the data only for Baltimore City and Los Angeles
    neidata <- neidata[neidata$fips == "24510" | 
                           neidata$fips == "06037",]
    # Get only Motor Vehicle sources
    sccdata <- sccdata[grep("Mobile - On-Road", sccdata$EI.Sector, 
                            ignore.case = TRUE),]
    # Merge the PM summary data for Baltimore and Los Angeles
    # with filtered source code data
    neisccdata <- merge(neidata, sccdata, by="SCC", all=FALSE)
    
    # Create the area for 1x1 plot
    par(mfrow = c(1,1), mar = c(5.1, 4.1, 4.1, 2.1))
    # Change the magnification size of the text and symbols
    par(cex = 1, cex.lab=0.75, cex.axis=0.5)
    
    # Draw a boxplot to show the comparison of motor vehicles
    # related PM summary data for Baltimore City and Los Angeles
    boxplot(Emissions~fips*year, data=neisccdata, 
            main="Comparison of Motor Vehicles Emissions \n For Los Angeles(LA) and Baltimore City(BC)", 
            xlab="City", 
            ylab="Emissions (in tons)", 
            col=c("Purple", "Yellow"), 
            outline=FALSE, 
            xaxt="n")
    # Customize the x-axis to show relevant labels
    axis(1, at=c(1,2,3,4,5,6,7,8), 
         labels=c("LA-1999", "BC-1999", "LA-2002", "BC-2002", 
                  "LA-2005", "BC-2005", "LA-2008", "BC-2008"))

    # Copy the plot to a png device
    dev.copy(png, file="plot6.png")
    # Turn the png device off
    dev.off()
}
