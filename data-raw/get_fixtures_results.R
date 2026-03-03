## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(fitzRoy)


# Get and save fixture history if not already obtained.
fixture_history_w = 
  tibble(
    "data" =
      pmap(
        list(2022:2026),
        fitzRoy::fetch_fixture,
        comp = "AFLW")
  ) |> 
  unnest(data) |> 
  janitor::clean_names() |> 
  mutate(venue_location = str_replace(venue_location, "Swan St", "Melbourne"))


# Get venues, geocode and calculate distances
library(sf)

venues_w = 
  fixture_history_w |>
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


distances_w =
  venues_w |> 
  rename_with(\(x) str_replace(x, "venue", "origin")) |> 
  expand_grid(
    venues_w |> 
      rename_with(\(x) str_replace(x, "venue", "destination"))
  ) |> 
  rowwise() |> 
  mutate(destination_distance = map2_dbl(origin_geometry,destination_geometry,
           sf::st_distance)) |> 
  select(contains("location"),contains("state"), destination_distance) |> 
  select(contains("origin"),contains("destination"),destination_distance) |> 
  as_tibble()

# add distance

team_distance_w = 
  fixture_history_w |>
  group_by(home_team_club_name, venue_location, venue_state) |>
  summarise(games = n()) |> 
  group_by(home_team_club_name) |> 
  arrange(desc(games)) |> 
  slice(1) |> 
  mutate(venue_address = str_c(venue_location, venue_state, sep =", ")) |> 
  rename_with(\(x) str_replace(x, "venue", "origin")) |> 
  unique() |> 
  left_join(
    distances_w
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

test = team_distance_w |> group_by(venue_location, venue_state) |> summarise(teams = n())

fixture_history_w =
  # Add home team distances
  fixture_history_w |> 
  left_join(
    team_distance_w |> 
      rename("home_team_club_name" = team_club_name,
             "home_distance"= venue_distance)) |> 
  # Add away distance
  left_join(
    team_distance_w |> 
      rename("away_team_club_name" = team_club_name,
             "away_distance"= venue_distance)) |> 
  select(-contains("byes"))
  


arrow::write_parquet(fixture_history_w, sink = "./data/fixture_history_w.parquet")
arrow::write_parquet(team_distance_w, sink = "./data/team_distance_w.parquet")


### MENS COMPETITION ###

# Get and save fixture history if not already obtained.
fixture_history_m = 
  tibble(
    "data" =
      pmap(
        list(2022:2026),
        fitzRoy::fetch_fixture,
        comp = "AFLM")
  ) |> 
  unnest(data) |> 
  janitor::clean_names() |> 
  mutate(venue_location = str_replace(venue_location, "Swan St", "Melbourne"))


# Get venues, geocode and calculate distances
venues_m = 
  fixture_history_m  |>
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


distances_m =
  venues_m |> 
  rename_with(\(x) str_replace(x, "venue", "origin")) |> 
  expand_grid(
    venues_m |> 
      rename_with(\(x) str_replace(x, "venue", "destination"))
  ) |> 
  rowwise() |> 
  mutate(destination_distance = map2_dbl(origin_geometry,destination_geometry,
                                         sf::st_distance)) |> 
  select(contains("location"),contains("state"), destination_distance) |> 
  select(contains("origin"),contains("destination"),destination_distance) |> 
  as_tibble()

# add distance

team_distance_m = 
  fixture_history_m |>
  group_by(home_team_club_name, venue_location, venue_state) |>
  summarise(games = n()) |> 
  group_by(home_team_club_name) |> 
  arrange(desc(games)) |> 
  slice(1) |> 
  mutate(venue_address = str_c(venue_location, venue_state, sep =", ")) |> 
  rename_with(\(x) str_replace(x, "venue", "origin")) |> 
  unique() |> 
  left_join(
    distances_m
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

test = team_distance_m |> group_by(venue_location, venue_state) |> summarise(teams = n())

fixture_history_m =
  # Add home team distances
  fixture_history_m |> 
  left_join(
    team_distance_m |> 
      rename("home_team_club_name" = team_club_name,
             "home_distance"= venue_distance)) |> 
  # Add away distance
  left_join(
    team_distance_m |> 
      rename("away_team_club_name" = team_club_name,
             "away_distance"= venue_distance)) |> 
  as_tibble() |>  
  select(-contains("byes")) |> 
  filter(comp_season_id != 85)



arrow::write_parquet(fixture_history_m, sink = "./data/fixture_history_m.parquet")
arrow::write_parquet(team_distance_m, sink = "./data/team_distance_m.parquet")
