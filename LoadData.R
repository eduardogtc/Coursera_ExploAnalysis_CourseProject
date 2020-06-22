# ------------------------------------------------------------------------------------------------ #
# Script to load the data
# COMMON SCRIPT TO ALL PLOTS
# ------------------------------------------------------------------------------------------------ #

suppressPackageStartupMessages(library(data.table))
suppressPackageStartupMessages(library(plyr))
suppressPackageStartupMessages(library(dplyr))

## Create a sub folder (IF NOT EXISTS) to store the data
sub_dir <- "project_data"
output_dir <- file.path(getwd(), sub_dir)

if (!dir.exists(output_dir)){
    dir.create(output_dir)
}

## Download and unzip the zip file
zip_file <- file.path( output_dir, "raw_data.zip")
url_target <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url_target, zip_file)
unzip(zipfile=zip_file, exdir = output_dir)

pm25 <- as.data.table(readRDS(file.path( output_dir, "summarySCC_PM25.rds")))
class_code <- as.data.table(readRDS(file.path( output_dir, "Source_Classification_Code.rds")))

pm25 <- merge(pm25, class_code, by = "SCC", all.x = TRUE )


