# Load the tidyverse package which contains readr, dplyr and tidyr
library(tidyverse)

# Read in the CSV file
data <- read_csv("original_file.csv")

# Reformat the data
reformatted_data <- data %>%
  # Spread the data to create new columns for each 'Warengruppe'
  spread(key = Warengruppe, value = Umsatz)

# Write the reformatted data to a new CSV file
write_csv(reformatted_data, "reformatted_file.csv")
