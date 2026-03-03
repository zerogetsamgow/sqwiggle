source("./r/sqwiggle_helpers.R")

# Extract pre-2025 fixtures to build starting model
model_data_m =
  arrow::read_parquet(file = "./data/fixture_history_m.parquet") |> 
  # Add outcome variable using helper function
  mutate(
    sqmiggle_outcome = 
      sqwigglize_margin(home_score_total_score - away_score_total_score),
    home_game_advantage = sqwigglize_hga(home_distance, away_distance)) 


library(elo)

# Set parameters for model
carry_over = .3

k_val = 40

# Build model
sqmiggle_elo_2026 = 
  elo.run(
    sqmiggle_outcome ~
      adjust(home_team_club_name, home_game_advantage) +
      away_team_club_name +
      regress(comp_season_name, 1500, carry_over) +
      group(round_provider_id),
    k = k_val,
    data = model_data_m) 

# Get current season data
season_2026_m = 
  tibble(
    "data" =
      pmap(
        list(2026),
        fitzRoy::fetch_fixture,
        comp = "AFLM",
        source = "AFL")
  ) |> 
  unnest(data) |> 
  janitor::clean_names() |> 
  select(-contains("byes"))

team_distance_m =
  arrow::read_parquet(file = "./data/team_distance_m.parquet") 

season_2026_m =
  # Add home team distances
  season_2026_m |> 
  left_join(
    team_distance_m |> 
      rename("home_team_club_name" = team_club_name,
             "home_distance"= venue_distance)) |> 
  left_join(
    team_distance_m |> 
      rename("away_team_club_name" = team_club_name,
             "away_distance"= venue_distance)) |> 
  mutate(home_game_advantage = sqwigglize_hga(home_distance, away_distance))

# Generate start of season tips
start_predict_m = 
  season_2026_m |>  
  mutate(prediction = 
           predict(sqmiggle_elo_2026, 
                   newdata = season_2026_m))

start_tip_tbl_m =
  start_predict_m |> 
  select(round_round_number, contains("club_name"), prediction, home_game_advantage) |>
  mutate(margin_predicted = round(unsqwiggle_outcome(prediction)+home_game_advantage,0),
         tip = sqwiggle_tip(.margin = margin_predicted ,
                            home_team = home_team_club_name,
                            away_team = away_team_club_name))


# Create shells for round by round data
tips_2026_m = tibble()
wins_2026_m = tibble()

sqmiggles_2026 = final.elos(sqmiggle_elo_2026) |>
  enframe(name = "team_club_name") |> 
  arrange(desc(value)) |> 
  mutate(round_number = -1)

# Generate tips for season to date round by round
last_round = 
  season_2026_m |>  
  filter(status %in% c("CONCLUDED")) |> 
  tail(1) |> 
  pull(round_round_number)



if(is_empty(last_round)){last_round = 0}

if(last_round>0){
  # Add outcome variable using helper function
  season_2026_m =
    season_2026_m|> 
    mutate(
      sqmiggle_outcome = 
        sqwigglize_margin(home_score_total_score - away_score_total_score)) 
}


for(.round in 0:last_round) {
  
  # Get data for current round
  round_data = season_2026_m |> 
    filter(round_round_number == .round)
  
  # Run predictions
  round_predict = 
    round_data|> 
    mutate(prediction = 
             predict(sqmiggle_elo_2026, 
                     newdata = round_data))
  
  # Convert to tips
  tip_tbl = 
    round_predict |> 
    select(round_round_number, contains("club_name"), prediction, home_game_advantage) |>
    mutate(margin_predicted = round(unsqwiggle_outcome(prediction)+home_game_advantage,0),
           tip = sqwiggle_tip(.margin = margin_predicted ,
                              home_team = home_team_club_name,
                              away_team = away_team_club_name))
  
  tips_2026_m = 
    bind_rows(
      tips_2026_m,
      tip_tbl)
  
  if(.round > 0) {
  # Get winners
  winner_tbl = 
    round_predict |> 
    mutate(
      margin = home_score_total_score - away_score_total_score,
      winner = 
        sqmiggle_winner(
          .margin = margin,
          home_team = home_team_club_name,
          away_team = away_team_club_name)) |> 
    select(round_round_number, contains("club_name"), winner)
  
  wins_2026_m = bind_rows(wins_2026_m, winner_tbl)
  }
  #Update model to incorporate tipped round
  model_data_m = bind_rows(model_data_m, round_data) |> 
    mutate(
      sqmiggle_outcome = 
        sqwigglize_margin(home_score_total_score - away_score_total_score))
  
  sqmiggle_elo_2026 = 
    elo.run(
      sqmiggle_outcome ~
        adjust(home_team_club_name, home_game_advantage) +
        away_team_club_name +
        regress(comp_season_name, 1500, carry_over) +
        group(round_provider_id),
      k = k_val,
      data = model_data_m)
  
  round_sqmiggles = 
    final.elos(sqmiggle_elo_2026) |>
    enframe(name = "team_club_name") |> 
    arrange(desc(value)) |> 
    mutate(round_number = .round)
  
  sqmiggles_2026 = bind_rows(sqmiggles_2026,round_sqmiggles)  
}

# Get data for future rounds
future_data = season_2026_m |> 
  filter(round_round_number > last_round)

# Run predictions
future_predict = 
  future_data |> 
  mutate(prediction = 
           predict(
             sqmiggle_elo_2026,
             newdata = future_data))

# Convert to tips
tip_tbl = 
  future_predict |> 
  select(round_round_number, contains("club_name"), prediction, home_game_advantage) |>
  mutate(margin_predicted = round(unsqwiggle_outcome(prediction)+home_game_advantage,0),
         tip = sqwiggle_tip(.margin = margin_predicted,
                            home_team = home_team_club_name,
                            away_team = away_team_club_name))

tips_2026_m = 
  bind_rows(
    tips_2026_m,
    tip_tbl)

tipping_results =
  tips_2026_m

if(nrow(wins_2026_m)>0) {
tipping_results =
  left_join(
    wins_2026_m,
    tipping_results,
    by = join_by(
      round_round_number,
      home_team_club_name,
      away_team_club_name,
      home_ground_advantage)
  ) |> 
  mutate(correct = as.integer(tip==winner)) |> 
  group_by(round_round_number) |> 
  mutate(round_score = sum(correct))
} else {
  tipping_results = 
    tipping_results |> 
    mutate(correct = 0) |> 
    group_by(round_round_number) |> 
    mutate(round_score = sum(correct))
}

# Calculate opponent strength

opponents = 
  season_2026_m |> 
  select(id, round_round_number, contains("team_club_name")) |> 
  pivot_longer(contains("team_club_name"), values_to = "team") 

oppo_strength = 
  opponents |> 
  left_join(
    opponents |> rename("opponent"="team"),
    by = join_by("id", "round_round_number")
  ) |> 
  filter(
    team!=opponent
  ) |> 
  select(
    "round_number" = round_round_number, team, opponent
  ) |> 
  left_join(
    sqmiggles_2026 |> 
      mutate(round_number = round_number + 1) |> 
      rename("opponent" = team_club_name),
    by = join_by("round_number", "opponent")
  ) |> 
  group_by(
    team
  ) |> 
  arrange(team, round_number) |> 
  fill(value) |> 
  filter(!is.na(value)) |> 
  summarise(
    total = sum(value)/n(),
  )


# Get actual ladder using fitZroy
actual_ladder = 
  fitzRoy::fetch_ladder(
    season = 2026,
  #  round_number = last_round,
    comp = "AFLM",
    source = "AFL"
  ) |> 
  janitor::clean_names() |>  
  select(
    team_club_name,
    round_number,
    "position_current" = position, 
    "wins_current" = this_season_record_win_loss_record_wins,
    starts_with("points")) 

# Generate predicted ladder 
predicted_ladder =
  start_tip_tbl_m|> 
  mutate(team_club_name = tip) |> 
  group_by(team_club_name) |> 
  summarise(wins_predicted = n())

if(last_round>0){
average_score = 
  season_2026_m |> 
  select(round_round_number, contains("total_score")) |> 
  pivot_longer(contains("score")) |> 
  summarise(value = mean(value, na.rm = TRUE))
}

percentage_adjustment = 
  start_tip_tbl_m |> 
  select(contains("team"),margin_predicted) |> 
  pivot_longer(contains("team"), values_to = "team_club_name", names_transform = \(x) str_remove(x, "_team.*")) |> 
  mutate(adjustment_sign = if_else(name == "home",1,-1),
         adjustment = adjustment_sign*margin_predicted) |> 
  group_by(team_club_name) |> 
  summarise(adjustment = sum(adjustment))

# Combine and format
combined_ladder =
  left_join(
    actual_ladder,
    predicted_ladder
  ) |> 
  mutate(wins_predicted = pmax(wins_predicted,0, na.rm = TRUE)) |> 
  left_join(percentage_adjustment) |> 
  mutate(percentage = (points_for+adjustment)/points_against*100) |> 
  arrange(desc(wins_predicted), desc(percentage)) |> 
  mutate(position_predicted = 1:18) |> 
  left_join(sqmiggles_2026) |> 
  arrange(desc(value)) |> 
  mutate(position_model = 1:18) |>
  select(
    team_club_name,
    starts_with("wins"),
    starts_with("position")
  ) |> 
  arrange(position_current) |> 
  mutate(position_change =  position_predicted - position_current) |> 
  left_join(
    oppo_strength |> rename("team_club_name" = team, "opposition_strength" = total)
  )

