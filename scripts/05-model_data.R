#### Preamble ####
# Purpose: Create model for suicide mortality rate with four predictor variables.
# Author: Taejun Um
# Date: 26 November 2024
# Contact: taejun.um@mail.utoronto.ca
# License: MIT
# Pre-requisites: Data must be downloaded and run 02-clean_data.R 


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


