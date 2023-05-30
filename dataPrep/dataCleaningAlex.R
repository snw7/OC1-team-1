# Alex - added FeiertageSH_ARNeu


library(utils)

# Read in the weather data file
weather <- read.csv('data/original/weather.csv')

# Read in the kiwo data file
kiwo <- read.csv('data/original/kiwo.csv')

# Read in the FeiertageSH_AR data file
FeiertageSH <- read.csv('data/original/FeiertageSH_AR.csv')

# Add a new column "KiWo" to the weather data frame, initialized with 0
weather$KiWo <- 0

# Add a new column "Feiertage" to the weather data drame, initialized with 0
weather$FeiertageSH <- 0

# Loop through each row in the weather data frame and check if the date exists in the kiwo data frame
for (i in 1:nrow(weather)) {
  date <- as.character(weather[i, "Datum"])
  if (date %in% kiwo$Datum) {
    weather[i, "KiWo"] <- 1
  }
}

# Loop through each row in the weather data frame and check if the date exists in the Feiertage data frame
for (i in 1:nrow(weather)) {
  date <- as.character(weather[i, "Datum"])
  if (date %in% FeiertageSH$Datum) {
    weather[i, "Feiertage"] <- 1
  }
}

# Write the updated weather data frame to a new CSV file
write.csv(weather, "data/updated_file_AR.csv", row.names = FALSE)

