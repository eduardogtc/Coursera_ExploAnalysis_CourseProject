# ------------------------------------------------------------------------------------------------ #
#                                       P L O T   5
# 
# Question: 
#
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
# ------------------------------------------------------------------------------------------------ #
library(ggplot2)

# Call the script that loads the data
source("LoadData.R")

# Summarise the emissions by year and  fiter city by BALTIMORE and type by motor vehicle ("ON-ROAD")
emmissions_by_year <- pm25 %>% 
    filter(fips == "24510", type=="ON-ROAD" ) %>% 
    group_by(year)  %>% 
    summarise(Total_Emissions = sum(Emissions))   

# Define the output
png('plot5.png')

# Create the chart
ggplot( emmissions_by_year, aes(x=as.character(year), y=Total_Emissions ))  +
    geom_bar(
        stat="identity", 
        fill = "orange"
    ) +
    labs(
        title = "Emissions by Year in Baltimore for Motor Vehicle",
        subtitle = "(1999, 2002, 2005 & 2008)",
        caption = "National Emissions Inventory (NEI)",
        tag = "Plot 5",
        x = "Year",
        y = "Total Emissions (Ton)"
    ) +
    theme_classic()

# Close the output (device)
dev.off()