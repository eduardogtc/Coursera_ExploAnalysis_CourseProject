# ------------------------------------------------------------------------------------------------ #
#                                       P L O T   2
# 
# Question: 
#
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question
# ------------------------------------------------------------------------------------------------ #
library(ggplot2)

# Call the script that loads the data
source("LoadData.R")

# Summarise the emissions by year and BALTIMORE
emmissions_by_year <-   pm25            %>% 
    filter(fips == "24510" ) %>% 
    group_by(year)  %>% 
    summarise(Total_Emissions = sum(Emissions))   

# Define the output
png('plot2.png')

# Create the chart
ggplot( emmissions_by_year, aes(x=as.character(year), y=Total_Emissions ))  +
    geom_bar(
        stat="identity", 
        fill = "darkmagenta"
    ) +
    labs(
        title = "Emissions by Year in Baltimore",
        subtitle = "(1999, 2002, 2005 & 2008)",
        caption = "National Emissions Inventory (NEI)",
        tag = "Plot 2",
        x = "Year",
        y = "Total Emissions (Ton)"
    ) +
    theme_classic()

# Close the output (device)
dev.off()
