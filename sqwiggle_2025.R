source("~/sqwiggle/sqwiggle_helpers.R")

# Extract pre-2025 fixtures to build starting model
model_data =
  arrow::read_parquet(file = "./data/fixture_history.parquet") |> 
  # Add outcome variable using helper function
  mutate(
    sqwiggle_outcome = 
      sqwigglize_margin(home_score_total_score - away_score_total_score),
    home_game_advantage = sqwigglize_hga(home_distance, away_distance)) |> 
  select(-contains("byes"))


library(elo)

# Set parameters for model
carry_over = .2
k_val = 40

# Build model
sqwiggle_elo_2025 = 
  elo.run(
    sqwiggle_outcome ~
      adjust(home_team_club_name, home_game_advantage) +
      away_team_club_name +
      regress(comp_season_name, 1500, carry_over) +
      group(round_provider_id),
    k = k_val,
    data = model_data)

# Get current season data
season_2025 = 
  tibble(
    "data" =
      pmap(
        list(2025),
        fitzRoy::fetch_fixture,
        comp = "AFLW",
        source = "AFL")
  ) |> 
  unnest(data) |> 
  janitor::clean_names()|> 
  # Add outcome variable using helper function
  mutate(
    sqwiggle_outcome = 
      sqwigglize_margin(home_score_total_score - away_score_total_score)) 
  

team_distance =
  arrow::read_parquet(file = "./data/team_distance.parquet") 

season_2025 =
  # Add home team distances
  season_2025 |> 
  left_join(
    team_distance |> 
      rename("home_team_club_name" = team_club_name,
             "home_distance"= venue_distance)) |> 
  left_join(
    team_distance |> 
      rename("away_team_club_name" = team_club_name,
             "away_distance"= venue_distance)) |> 
  mutate(home_game_advantage = sqwigglize_hga(home_distance, away_distance))
  

# Create shells for round by round data
tips_2025 = tibble()
wins_2025 = tibble()
sqwiggles_2025 = final.elos(sqwiggle_elo_2025) |>
  enframe(name = "team_club_name") |> 
  arrange(desc(value)) |> 
  mutate(round_number = 0)


# Generate tips for season to date round by round

last_round = 
  season_2025 |>  
  filter(status %in% c("CONCLUDED")) |> 
  tail(1) |> 
  pull(round_round_number)
  

for(.round in 1:last_round) {
  
  # Get data for current round
  round_data = season_2025 |> 
    filter(round_round_number == .round)
  
  # Run predictions
  round_predict = 
    round_data|> 
    mutate(prediction = predict(sqwiggle_elo_2025, newdata = round_data))
  
  # Convert to tips
  tip_tbl = 
    round_predict |> 
    select(round_round_number, contains("club_name"), prediction, home_game_advantage) |>
    mutate(margin_predicted = round(unsqwiggle_outcome(prediction)+home_game_advantage,0),
           tip = sqwiggle_tip(.margin = margin_predicted ,
                               home_team = home_team_club_name,
                               away_team = away_team_club_name))
  
  tips_2025 = 
    bind_rows(
      tips_2025,
      tip_tbl)
  
  # Get winners
  winner_tbl = 
    round_predict |> 
    mutate(
      margin = home_score_total_score - away_score_total_score,
      winner = 
        sqwiggle_winner(
          .margin = margin,
          home_team = home_team_club_name,
          away_team = away_team_club_name)) |> 
    select(round_round_number, contains("club_name"), winner)
  
  wins_2025 = bind_rows(wins_2025, winner_tbl)
  
  #Update model to incorporate tipped round
  model_data = bind_rows(model_data, round_data) |> 
    mutate(
      sqwiggle_outcome = 
        sqwigglize_margin(home_score_total_score - away_score_total_score))
  
  sqwiggle_elo_2025 = 
    elo.run(
      sqwiggle_outcome ~
        adjust(home_team_club_name, home_game_advantage) +
        away_team_club_name +
        regress(comp_season_name, 1500, carry_over) +
        group(round_provider_id),
      k = k_val,
      data = model_data)
  
  round_sqwiggles = 
    final.elos(sqwiggle_elo_2025) |>
    enframe(name = "team_club_name") |> 
    arrange(desc(value)) |> 
    mutate(round_number = .round)
  
  sqwiggles_2025 = bind_rows(sqwiggles_2025,round_sqwiggles)  
}

tipping_results =
  left_join(
    tips_2025,
    wins_2025) |> 
  mutate(correct = as.integer(tip==winner)) |> 
  group_by(round_round_number) |> 
  mutate(round_score = sum(correct))

# Calculate opponent strength

opponents = 
  season_2025 |> 
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
    sqwiggles_2025 |> 
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
    roo_test = any(opponent == "North Melbourne")
  )


  
# Get data for future rounds
future_data = season_2025 |> 
  filter(round_round_number > last_round )
  
  # Run predictions
  future_predict = 
    future_data|> 
    mutate(prediction = predict(sqwiggle_elo_2025, newdata = future_data))
  
  # Convert to tips
  tip_tbl = 
    future_predict |> 
    select(round_round_number, contains("club_name"), prediction, home_game_advantage) |>
    mutate(margin_predicted = round(unsqwiggle_outcome(prediction)+home_game_advantage,0),
           tip = sqwiggle_tip(.margin = margin_predicted,
                              home_team = home_team_club_name,
                              away_team = away_team_club_name))
  
  tips_2025 = 
    bind_rows(
      tips_2025,
      tip_tbl)
  
# Get actual ladder using fitZroy
actual_ladder = 
  fitzRoy::fetch_ladder(
    season = 2025,
    round_number = last_round,
    comp = "AFLW",
    source = "AFL"
  ) |> 
  janitor::clean_names() |>  
  select(
    team_club_name,
    round_number,
    "position_current" = position, 
    "wins_current" = this_season_record_win_loss_record_wins)
 
# Generate predicted ladder 
predicted_ladder =
  left_join(
      tips_2025,
      wins_2025) |> 
    mutate(team_club_name = coalesce(winner,tip)) |> 
    group_by(team_club_name) |> 
    summarise(wins_predicted = n()) 

# Combine and format
combined_ladder =
  left_join(
    actual_ladder,
    predicted_ladder
  ) |> 
  arrange(desc(wins_predicted), position_current) |> 
  mutate(position_predicted = 1:18) |> 
  left_join(sqwiggles_2025) |> 
  arrange(desc(value)) |> 
  mutate(position_model = 1:18) |>
  select(
    team_club_name,
    starts_with("wins"),
    starts_with("position")
  ) |> 
  arrange(position_predicted) |> 
  mutate(position_change =  position_current - position_predicted) |> 
  left_join(
    oppo_strength |> rename("team_club_name" = team, "opposition_strength" = total)
  )
