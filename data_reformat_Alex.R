# Load the tidyverse package which contains readr, dplyr and tidyr
library(tidyverse)

# Read in the CSV file
data <- read_csv('data/data_combined.csv')

# Convert 'Datum' column to date
data$Datum <- as.Date(data$Datum, format = "%Y-%m-%d")

# Reformat the data
reformatted_data <- data %>%
  # Group by 'Datum'
  group_by(Datum) %>%
  # Summarize 'Umsatz' and get the first value of other columns within each 'Datum' group
  summarise(
    KielerWoche = first(KielerWoche),
    Bewoelkung = first(Bewoelkung),
    Temperatur = first(Temperatur),
    Windgeschwindigkeit = first(Windgeschwindigkeit),
    Wettercode = first(Wettercode),
    weekday = first(weekday),
    FerienSH = first(FerienSH),
    Warengruppe = list(Warengruppe),
    Umsatz = list(Umsatz)
  ) %>%
  # Ungroup the data
  ungroup() %>%
  # 'unnest()' to bring the data back to a normal data frame structure
  unnest(cols = c(Umsatz, Warengruppe)) %>%
  # Spread the data to create new columns for each 'Warengruppe'
  spread(key = Warengruppe, value = Umsatz)

# Write the reformatted data to a new CSV file
write_csv(reformatted_data, 'data_reformatted_testAR.csv')
