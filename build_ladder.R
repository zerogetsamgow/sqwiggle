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
    "wins_current" = this_season_record_win_loss_record_wins,
    starts_with("points")) 

# Generate predicted ladder 
predicted_ladder =
  left_join(
    tips_2025,
    wins_2025
   ) |> 
  mutate(team_club_name = coalesce(winner,tip)) |> 
  group_by(team_club_name) |> 
  summarise(wins_predicted = n()) 


average_score = season_2025 |> 
  select(round_round_number, contains("total_score")) |> 
  pivot_longer(contains("score")) |> 
  summarise(value = mean(value, na.rm = TRUE))

percentage_adjustment = 
  tips_2025 |> 
  filter(round_round_number > last_round) |> 
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
  left_join(percentage_adjustment) |> 
  mutate(percentage = (points_for+adjustment)/points_against*100) |> 
  arrange(desc(wins_predicted), desc(percentage)) |> 
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
