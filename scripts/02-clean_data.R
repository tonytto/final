#### Preamble ####
# Purpose: Cleans the raw data from "01-test_simulated_data.R".
# Author: Taejun Um
# Date: 26 November 2024
# Contact: taejun.um@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have downloaded raw dataset (raw_data.csv) 
# in data/01-raw_data

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/country_suicide_raw_data.csv")

reshaped_data <- raw_data |>
  select(-"Series Code", -"Country Code") |>
  pivot_wider(names_from = "Series Name", values_from = "2019 [YR2019]") |>
  select(-"NA") |>
  rename(
    country = "Country Name",
    suicide_rate = "Suicide mortality rate (per 100,000 population)",
    gdp_per_capita = "GDP per capita (current US$)",
    unemploy_rate = "Unemployment, total (% of total labor force) (modeled ILO estimate)",
    youth_neet_rate = "Share of youth not in education, employment or training, total (% of youth population)  (modeled ILO estimate)",
    alcohol_consumption = "Total alcohol consumption per capita (liters of pure alcohol, projected estimates, 15+ years of age)")

reshaped_data[reshaped_data == ".."] <- NA


# Drop rows where all columns are NA
cleaned_data <- reshaped_data |> 
  tidyr::drop_na()

# Change variable type from list to double
cleaned_data$suicide_rate <- as.numeric(as.character(cleaned_data$suicide_rate))
cleaned_data$gdp_per_capita <- as.numeric(as.character(cleaned_data$gdp_per_capita))
cleaned_data$unemploy_rate <- as.numeric(as.character(cleaned_data$unemploy_rate))
cleaned_data$youth_neet_rate <- as.numeric(as.character(cleaned_data$youth_neet_rate))
cleaned_data$alcohol_consumption <- as.numeric(as.character(cleaned_data$alcohol_consumption))

# Divide gdp_per_capita by 100 for clearity
cleaned_data$gdp_per_capita <- cleaned_data$gdp_per_capita/100



#### Save data ####
write_parquet(cleaned_data, "data/02-analysis_data/cleaned_suicide_data.parquet")
