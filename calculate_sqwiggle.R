home_game_advantage = 10
carry_over = .6
k_val = 20

completed =
  completed |> 
  mutate(
    sqwiggle_outcome = 
      sqwigglize_margin(home_score_total_score - away_score_total_score))

library(elo)

sqwiggle_elo = 
  elo.run(
  sqwiggle_outcome ~
    adjust(home_team_club_name, home_game_advantage) +
    away_team_club_name +
    regress(comp_season_name, 1500, carry_over) +
    group(round_provider_id),
  k = k_val,
  data = completed)

sqwiggle_tbl = 
  sqwiggle_elo |> 
  as_tibble()

current_rankings = final.elos(sqwiggle_elo) |> enframe(name = "team_name") |> arrange(desc(value)) 

sqwiggle_predict =
  scheduled |> 
  mutate(prediction = predict(sqwiggle_elo, newdata = scheduled))
