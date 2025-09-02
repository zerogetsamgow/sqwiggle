home_game_advantage = 10
carry_over = .8
k_val = 10


source("~/sqwiggle/data-raw/get_fixtures_results.R")

# Extract pre-2025 fixtures to build starting model
pre_2025 =
  fixture |>
  filter(!comp_season_year == 2025) |> 
  mutate(
    sqwiggle_outcome = 
      sqwigglize_margin(home_score_total_score - away_score_total_score))

season_2025 = 
  fixture |>
  filter(comp_season_year == 2025)

library(elo)

sqwiggle_elo_2025 = 
  elo.run(
    sqwiggle_outcome ~
      adjust(home_team_club_name, home_game_advantage) +
      away_team_club_name +
      regress(comp_season_name, 1500, carry_over) +
      group(round_provider_id),
    k = k_val,
    data = pre_2025)

sqwiggle_tbl = 
  sqwiggle_elo |> 
  as_tibble()

start_2025_rankings = final.elos(sqwiggle_elo) |> enframe(name = "team_name") |> arrange(desc(value)) 

tips_2025 = tibble()
wins_2025 = tibble()
sqwuiggles_2025 = tibble()

for(.round in 1:3) {
  
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
    select(round_round_number, contains("club_name"), prediction) |>
    mutate(margin_predicted = unsqwiggle_outcome(prediction),
           tip = sqwiggle_tip(.prediction = prediction,
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
      sqwiggle_outcome = 
        sqwigglize_margin(home_score_total_score - away_score_total_score),
      winner = 
        sqwiggle_winner(
          .outcome = sqwiggle_outcome,
          home_team = home_team_club_name,
          away_team = away_team_club_name)) |> 
    select(round_round_number, contains("club_name"), winner)
  
  wins_2025 = bind_rows(wins_2025, winner_tbl)
  
  #Update model to incorporate tipped round
  round_sqwiggles = 
    final.elos(sqwiggle_elo) |>
    enframe(name = "team_name") |> 
    arrange(desc(value)) |> 
    mutate(round_round_number = .round)
    
  sqwiggles_2025 = bind_rows(sqwuiggles_2025,round_sqwiggles)  
  
  sqwiggle_elo_2025 = 
    elo.run(
      sqwiggle_outcome ~
        adjust(home_team_club_name, home_game_advantage) +
        away_team_club_name +
        regress(comp_season_name, 1500, carry_over) +
        group(round_provider_id),
      k = k_val,
      data = bind_rows(pre_2025, round_data))
}

tipping_results =
  left_join(
    tips_2025,
    wins_2025) |> 
  mutate(correct = as.integer(tip==winner)) |> 
  group_by(round_round_number) |> 
  mutate(round_score = sum(correct))


  
# Get data for future rounds
future_data = season_2025 |> 
  filter(round_round_number > 3 )
  
  # Run predictions
  future_predict = 
    future_data|> 
    mutate(prediction = predict(sqwiggle_elo_2025, newdata = future_data))
  
  # Convert to tips
  tip_tbl = 
    future_predict |> 
    select(round_round_number, contains("club_name"), prediction) |>
    mutate(margin_predicted = unsqwiggle_outcome(prediction),
           tip = sqwiggle_tip(.prediction = prediction,
                              home_team = home_team_club_name,
                              away_team = away_team_club_name))
  
  tips_2025 = 
    bind_rows(
      tips_2025,
      tip_tbl)
  
  
  predicted_ladder =
    left_join(
      tips_2025,
      wins_2025) |> 
    mutate(predicted_winner = coalesce(winner,tip)) |> 
    group_by(predicted_winner) |> 
    summarise(wins = n()) |> 
    arrange(desc(wins))
  

   