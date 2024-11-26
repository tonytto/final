# A Cross-National Analysis of Risk Factors and Prevention Strategies (2019)

## Overview

Suicide is not merely an individual's suffering but a profound societal issue that disrupts the cohesion of communities. Reducing suicide rates is a global imperative with universal agreement. This paper focuses on national suicide rates and analyzes the impact of various socioeconomic factors on these rates.
We used a Bayesian multi linear regression model to conduct the analysis, utilizing data sourced from the World Bank's DataBank.


## File Structure

The repo is structured as:

-   `data/01-raw_data` contains the raw data as obtained from DataBank. The process of obtaining this data specified below.
-   `data/02-analysis_data` contains the cleaned dataset that was constructed.
-   `models` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download, and clean data. It also includes script used to create model.

## Download Data


The data used in this study was obtained from the World Bank's (DataBank)[https://databank.worldbank.org/source/world-development-indicators#]. World Development Indicators dataset was sued and this dataset includes 1,496 variables, requiring selection and configuration to focus on the five variables used, as well as specific countries and the year. The steps for this setup are as follows:

1. Access the DataBank via the provided link.
2. In the Country section, change the default option from All to Countries, then click Select All.
3. In the Series section, search for and check the following variables:
  - Suicide mortality rate (per 100,000 population)
  - GDP per capita (current US$)
  - Unemployment, total (% of total labor force) (modeled ILO estimate)
  - Share of youth not in education, employment, or training, total (% of youth population) (modeled ILO   estimate)
  Total alcohol consumption per capita (liters of pure alcohol, projected estimates, 15+ years of age)
4. In the Time section, check the year 2019.
5. Click Apply Changes in the center of the page.
6. From the Download Options dropdown menu, select CSV to save the dataset.


## Statement on LLM usage

GPT-4 was used to aid in the writing of this paper. It was mainly used for coding aspects, such as cleaning data and drawing graphs. The entire chat history is available in other/llm_usage/usage.txt.