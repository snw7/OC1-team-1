# Assumption: You already have a training dataset named "train_data" with the respective variables.

# Install and load the "car" package for the adjusted R²
install.packages("car")
library(car)

# Create a linear model with all variables
lm_model <- lm(Y ~ ., data = train_data)

# Define the function to perform backward stepwise regression
optimize_model <- function(model) {
  return(step(model, direction = "backward", trace = 0))
}

# Optimize the model
optimized_model <- optimize_model(lm_model)

# Print the summary of the optimized model
summary(optimized_model)
