#### Preamble ####
# Purpose: Creates a random dataset with sucide mortality rate, gdp per capita, 
# unemployment rate, youth NEET rate, and alcohol consumption for 217 nations.
# Author: Taejun Um
# Date: 26 November 2024
# Contact: taejun.um@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed


#### Workspace setup ####
library(tidyverse)
set.seed(4020)


#### Simulate data ####

num_country = 217

# Create a dataset
analysis_data <- tibble(
  country = paste("Country", 1:num_country),
  suicide_rate = round(rnorm(num_country, 10, 1), 1),
  gdp_per_capita = rlnorm(num_country, 9.5, 0.6),
  unemploy_rate = round(rnorm(num_country, 10, 1), 3),
  youth_neet_rate = round(rnorm(num_country, 15, 1), 3),
  alocohol_consumption =round(rnorm(num_country, 5, 1), 2)
)


#### Save data ####
write_csv(analysis_data, "data/00-simulated_data/simulated_data.csv")
