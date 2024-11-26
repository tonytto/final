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

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/country_suicide_raw_data.csv")

reshaped_data <- raw_data |>
  select(-"Series Code", -"Country Code") |>
  pivot_wider(names_from = "Series Name", values_from = "2019 [YR2019]") |>
  select(-"NA")

reshaped_data[reshaped_data == ".."] <- NA

# Drop rows where all columns are NA
cleaned_data <- reshaped_data |> tidyr::drop_na()

#### Save data ####
write_parquet(cleaned_data, "data/02-analysis_data/cleaned_suicide_data.csv")
