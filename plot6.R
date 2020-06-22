# ------------------------------------------------------------------------------------------------ #
#                                       P L O T   6
# 
# Question: 
#
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
# sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?
# ------------------------------------------------------------------------------------------------ #
library(ggplot2)

# Call the script that loads the data
source("LoadData.R")

# Set up the city variables
code_cities <- c( "24510", "06037")
name_cities <- c("Baltimore", "Los Angeles")

# Summarise the emissions by year and  fiter city by BALTIMORE and type by motor vehicle ("ON-ROAD")
emmissions_by_year <- pm25 %>% 
    filter(fips %in% code_cities, type=="ON-ROAD" ) %>% 
    group_by(year, City=fips)  %>% 
    summarise(Total_Emissions = sum(Emissions))   

# Transform in a data table
emmissions_by_year <- as.data.table(emmissions_by_year)

# Change the code for City Names
emmissions_by_year[,City:= mapvalues( City, code_cities, name_cities) ]

# Define the output
png('plot6.png')

# Create the chart
ggplot( emmissions_by_year, aes(x=as.character(year), y=Total_Emissions ))  +
    facet_grid(. ~ City) +
    geom_bar(
        stat="identity", 
        fill = "darkgreen"
    ) +
    labs(
        title = "Emissions by Year in Baltimore and Los Angeles for Motor Vehicle",
        subtitle = "(1999, 2002, 2005 & 2008)",
        caption = "National Emissions Inventory (NEI)",
        tag = "Plot 6",
        x = "Year",
        y = "Total Emissions (Ton)"
    ) +
    geom_text(aes(label=round(Total_Emissions,0), x=as.character(year), y=round(Total_Emissions,0)+120), colour="black") +
    theme_minimal()

# Close the output (device)
dev.off()