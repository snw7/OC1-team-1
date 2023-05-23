# Load the tidyverse package which contains readr, dplyr and tidyr
library(tidyverse)

# Read in the CSV file
data <- read_csv("/oc.team1.1/data/data_combined.csv")

# Reformat the data
reformatted_data <- data %>%
  # Spread the data to create new columns for each 'Warengruppe'
  spread(key = Warengruppe, value = Umsatz)

# Write the reformatted data to a new CSV file
write_csv(data_reformatted_testAR, "data_reformatted_testAR.csv")

