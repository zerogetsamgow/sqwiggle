## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(fitzRoy)

# Get and save fixture history if not already obtained.
fixture_history = 
  tibble(
    "data" =
      pmap(
        list(2022:2024),
        fitzRoy::fetch_fixture,
        comp = "AFLW")
  ) |> 
  unnest(data) |> 
  janitor::clean_names() 

arrow::write_parquet(fixture_history, sink = "./data/fixture_history.parquet")

# completed = fixture |> filter(status == "CONCLUDED") 
# scheduled = fixture |> filter(status == "SCHEDULED") 

