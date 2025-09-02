## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(fitzRoy)

# Set cookie for getting round data
my_cookie = fitzRoy::get_afl_cookie()

fixture = 
  tibble(
    "data" =
      pmap(
        list(2022:2025),
        fitzRoy::fetch_fixture,
        comp = "AFLW")
  ) |> 
  unnest(data) |> 
  janitor::clean_names() |> 
  select(-contains("abbreviation"), -contains("short"), -contains("type"), -contains("metadata")  )

completed = fixture |> filter(status == "CONCLUDED") 
scheduled = fixture |> filter(status == "SCHEDULED") 

