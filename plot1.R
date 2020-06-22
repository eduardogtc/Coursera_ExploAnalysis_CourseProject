# ------------------------------------------------------------------------------------------------ #
#                                       P L O T   1
# 
# Question: 
#
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base 
# plotting system, make a plot showing the total PM2.5 emission from all sources for each of the 
# years 1999, 2002, 2005, and 2008.
# ------------------------------------------------------------------------------------------------ #

library(ggplot2)

# Call the script that loads the data
source("LoadData.R")

# Summarise the emissions by year
emmissions_by_year <-   pm25            %>% 
                        group_by(year)  %>% 
                        summarise(Total_Emissions = sum(Emissions))   


# Define the output
png('plot1.png')

# Create the chart
ggplot( emmissions_by_year, aes(x=as.character(year), y=Total_Emissions ))  +
        geom_bar(
            stat="identity", 
            fill = "dodgerblue"
                ) +
        labs(
            title = "Emissions by Year",
            subtitle = "(1999, 2002, 2005 & 2008)",
            caption = "National Emissions Inventory (NEI)",
            tag = "Plot 1",
            x = "Year",
            y = "Total Emissions (Ton)"
            ) +
        theme_classic()

# Close the output (device)
dev.off()
