## Introduction

A set of R scripts performs exploratory data analysis on the [fine particulate matter (PM) data](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip) available from National Emissions Inventory (NEI). For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data used here are for 1999, 2002, 2005 and 2008.

The dataset contains two files:
* summarySCC_PM25.rds - This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year.
* Source_Classification_Code.rds - This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful.

<b>The above files are serialized R objects and should be read accordingly.</b>

Following questions are answered by the scripts, by creating a graph plot for that question:
<ol>
<li>Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008. - <b>plot1.R and plot1.png</b></li>
<li>Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question. - <b>plot2.R and plot2.png</b></li>
<li>Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question. - <b>plot3.R and plot3.png</b></li>
<li>Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008? - <b>plot4.R and plot4.png</b></li>
<li>How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? - <b>plot5.R and plot5.png</b></li>
<li>Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions? - <b>plot6.R and plot6.png</b></li>
</ol>

