install.packages("tidyverse")
install.packages("conflicted")

detach("package:tidyverse")
update.packages("tidyverse")


library(tidyverse)
library(conflicted)

# Read CSV files
f13 <- read_csv('Feiertage2013.CSV')
f14 <- read_csv('Feiertage2014.CSV')
f15 <- read_csv('Feiertage2015.CSV')
f16 <- read_csv('Feiertage2016.CSV')
f17 <- read_csv('Feiertage2017.CSV')
f18 <- read_csv('Feiertage2018.CSV')
f19 <- read_csv('Feiertage2019.CSV')
f20 <- read_csv('Feiertage2020.CSV')
f21 <- read_csv('Feiertage2021.CSV')
f22 <- read_csv('Feiertage2022.CSV')
f23 <- read_csv('Feiertage2023.CSV')


# Merge the two dataframes based on the common columns
merged_feiertage = pd.merge(f13, f14, f15, f16, f17, f18, f19, f20, f21, f22, f23 on=['Datum', 'Wochentag', 'Name', 'Art', 'Details'])

# Save the merged dataframe to a new CSV file
merged_feiertage.to_csv('feiertage.csv', index=False)
