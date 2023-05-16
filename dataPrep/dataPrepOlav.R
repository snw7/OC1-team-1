# Data preparation script - Olav Cornelius

# LOAD LIBRARIES
library(dplyr)
#library(ggplot2)
#library(tidyverse)
library(lubridate)

# READ DATA
revenue <- read.csv("data/original/umsatzdaten_gekuerzt.csv")
kiwo <- read.csv("data/original/kiwo.csv")
weather <- read.csv("data/original/weather.csv")

# Add weekday column
revenue <- mutate(revenue, weekday = wday(Datum, label = TRUE))

# Add item description column
item_descriptions <- c("Brot", "Broetchen", "Croissant", "Konditorei", "Kuchen", "Saisonbrot")
revenue <- mutate(revenue, item_description = item_descriptions[Warengruppe])

# Convert date columns to proper Date format
revenue$date <- as.Date(revenue$Datum)
kiwo$date <- as.Date(kiwo$Datum)

# Add boolean column indicating if the date is present in the other dataset
revenue <- mutate(revenue, date_present = date %in% kiwo$date)

# Create a copy of revenue dataset with matching dates only
revenue_kiwo <- filter(revenue, date_present)

# Print the modified revenue dataset
print(revenue)
print(revenue_kiwo)

