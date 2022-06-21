

# Load required libraries

library(tidytuesdayR)
library(tidyverse)
library(lubridate)


# Load the data

tuesdata <- tidytuesdayR::tt_load('2022-06-14')
drought <- tuesdata$drought


# Clean the data 

drought_clean <- drought %>% 
  # Extract the part containing the date from the string 
  dplyr::mutate(Date = str_extract(DATE,"\\d+")) %>%
  # Convert the date from string to a date object
  dplyr::mutate(Date = lubridate::ymd(Date)) %>%
  # Filter only dates from the year 2001 to 2022
  dplyr::filter(Date >= "2001-01-01") %>%
  # Capitalize the names of U.S. states
  dplyr::mutate(State = str_to_title(state, locale = "en")) %>%
  # Drop the original DATE and state column
  dplyr::select(-c(DATE, state)) 



# Check for missing values

sum(is.na(drought_clean))


# Perform EDA

# Get overall summary of the data
summary(drought_clean)





