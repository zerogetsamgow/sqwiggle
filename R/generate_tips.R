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

tipping_results =
  left_join(
    wins_2025,
    tips_2025,
    ) |> 
  mutate(correct = as.integer(tip==winner)) |> 
  group_by(round_round_number) |> 
  mutate(round_score = sum(correct))
