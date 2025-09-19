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
  janitor::clean_names() |> 
  mutate(venue_location = str_replace(venue_location, "Swan St", "Melbourne"))



# completed = fixture |> filter(status == "CONCLUDED") 
# scheduled = fixture |> filter(status == "SCHEDULED") 

# Get venues, geocode and calculate distances
library(sf)

venues = 
  fixture_history |>
  select(venue_location, venue_state) |>
  unique() |> 
  mutate(venue_address = str_c(venue_location, venue_state, sep =", ")) |>
  rowwise() |> 
  mutate(
    geocode = map(venue_address, googleway::google_geocode)
  ) |> 
  unnest_wider(geocode) |> 
  unnest(results) |> 
  unnest(geometry) |> 
  select(contains("venue"), contains("location")) |> 
  unnest(location) |> 
  select(-location_type) |> 
  sf::st_as_sf(coords = c("lng", "lat")) |> 
  as_tibble() |> 
  rename("venue_geometry" = geometry) |> 
  unique()


distances =
  venues |> 
  rename_with(\(x) str_replace(x, "venue", "origin")) |> 
  expand_grid(
    venues |> 
      rename_with(\(x) str_replace(x, "venue", "destination"))
  ) |> 
  rowwise() |> 
  mutate(destination_distance = map2_dbl(origin_geometry,destination_geometry,
           sf::st_distance)) |> 
  select(contains("location"),contains("state"), destination_distance) |> 
  select(contains("origin"),contains("destination"),destination_distance) |> 
  as_tibble()

# add distance

team_distance = 
  fixture_history |>
  group_by(home_team_club_name, venue_location, venue_state) |>
  summarise(games = n()) |> 
  group_by(home_team_club_name) |> 
  arrange(desc(games)) |> 
  slice(1) |> 
  mutate(venue_address = str_c(venue_location, venue_state, sep =", ")) |> 
  rename_with(\(x) str_replace(x, "venue", "origin")) |> 
  unique() |> 
  left_join(
    distances
  ) |> 
  select(
    team_club_name = "home_team_club_name",
    contains("destination")
  ) |> 
  group_by(
    team_club_name,
    destination_location,
    destination_state
  ) |> 
  slice(1) |> 
  rename_with(\(x) str_replace(x, "destination", "venue")) 

test = team_distance |> group_by(venue_location, venue_state) |> summarise(teams = n())

fixture_history =
  # Add home team distances
  fixture_history |> 
  left_join(
    team_distance |> 
      rename("home_team_club_name" = team_club_name,
             "home_distance"= venue_distance)) |> 
  left_join(
    team_distance |> 
      rename("away_team_club_name" = team_club_name,
             "away_distance"= venue_distance))
  


arrow::write_parquet(fixture_history, sink = "./data/fixture_history.parquet")
arrow::write_parquet(team_distance, sink = "./data/team_distance.parquet")
