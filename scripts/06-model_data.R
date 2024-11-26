#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(arrow)

#### Read data ####
cleaned_data2 <- read_parquet("data/02-analysis_data/cleaned_suicide_data.parquet")

### Model data ####
first_model <-
  stan_glm(
    formula = suicide_rate ~ gdp_per_capita + unemploy_rate + youth_neet_rate + alcohol_consumption,
    data = cleaned_data2,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )

lm(suicide_rate ~ gdp_per_capita + unemploy_rate + youth_neet_rate + alcohol_consumption,
   data = cleaned_data2)

#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)


