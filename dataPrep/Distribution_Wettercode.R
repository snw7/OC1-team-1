library(readr)
library(ggplot2)

revenue <- read.csv("data/data_combined.csv")
value_chain <- revenue$Wettercode

# Calculate the frequency of each number
value_counts <- table(value_chain)

# Create a data frame from the value counts
data <- data.frame(Number = as.numeric(names(value_counts)), Frequency = as.numeric(value_counts))

# Create the bar chart using ggplot2
chart <- ggplot(data, aes(x = Number, y = Frequency)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Number", y = "Frequency", title = "Distribution of Numbers") +
  theme_minimal()

# Display the chart
print(chart)

