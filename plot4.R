# ------------------------------------------------------------------------------------------------ #
#                                       P L O T   4
# 
# Question: 
#
# Across the United States, how have emissions from coal combustion-related sources changed 
# from 1999–2008?
# ------------------------------------------------------------------------------------------------ #
library(ggplot2)

# Call the script that loads the data
source("LoadData.R")

# Summarise the emissions by year and type and fiter city by BALTIMORE
emmissions_by_year <-   pm25            %>% 
    filter(grepl("coal", Short.Name, ignore.case=TRUE)) %>% 
    group_by(year)  %>% 
    summarise(Total_Emissions = sum(Emissions))   

# Define the output
png('plot4.png')

# Create the chart
ggplot( emmissions_by_year, aes(x=as.character(year), y=Total_Emissions ))  +
    geom_bar(
        stat="identity", 
        fill = "dimgray"
    ) +
    labs(
        title = "Emissions by Year for COAL",
        subtitle = "(1999, 2002, 2005 & 2008)",
        caption = "National Emissions Inventory (NEI)",
        tag = "Plot 4",
        x = "Year",
        y = "Total Emissions (Ton)"
    ) +
    theme_classic()

# Close the output (device)
dev.off()