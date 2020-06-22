# ------------------------------------------------------------------------------------------------ #
#                                       P L O T   3
# 
# Question: 
#
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
# ------------------------------------------------------------------------------------------------ #
library(ggplot2)

# Call the script that loads the data
source("LoadData.R")

# Summarise the emissions by year and type and fiter city by BALTIMORE
emmissions_by_year <-   pm25            %>% 
    filter(fips == "24510" ) %>% 
    group_by(type, year)  %>% 
    summarise(Total_Emissions = sum(Emissions))   


# Define the output
png('plot3.png')

# Create the chart
ggplot( emmissions_by_year, aes(x=year, y=Total_Emissions, color=type ))  +
    geom_line() +
    labs(
        title = "Emissions by Year and type in Baltimore",
        subtitle = "(1999, 2002, 2005 & 2008)",
        caption = "National Emissions Inventory (NEI)",
        tag = "Plot 3",
        x = "Year",
        y = "Total Emissions (Ton)",
        color="Type"
    ) +
    theme_classic()

# Close the output (device)
dev.off()

