# Load the tidyverse package which contains readr, dplyr and tidyr
library(tidyverse)

# Read in the CSV file
data <- read_csv('data/data_combined.csv')

# Reformat the data
reformatted_data <- data %>%
  # Group by 'Datum' and 'Warengruppe' and summarize 'Umsatz'
  group_by(Datum, Warengruppe) %>%
  summarize(Umsatz = sum(Umsatz, na.rm = TRUE)) %>%
  # Spread the data to create new columns for each 'Warengruppe'
  spread(key = Warengruppe, value = Umsatz)

# Write the reformatted data to a new CSV file
write_csv(reformatted_data, "data_reformatted_testAR.csv")

