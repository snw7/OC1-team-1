input_file <- "data/original/FeiertageSH.csv"
output_file <- "data/FeiertageSH_neu.csv"

# Read the CSV file
data <- read.csv(input_file)

# Reformat the date column
data$Datum <- format(as.Date(data$Datum, "%d.%m.%Y"), "%Y-%m-%d")

# Write the reformatted data to a new CSV file
write.csv(data, file = output_file, row.names = FALSE)

cat("CSV file reformatted successfully.\n")


