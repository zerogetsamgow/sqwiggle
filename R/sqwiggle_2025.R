#source("~/sqwiggle/sqwiggle_helpers.R")

# Extract pre-2025 fixtures to build starting model
model_data =
  arrow::read_parquet(file = "./data/fixture_history.parquet") |> 
  # Add outcome variable using helper function
  dplyr::mutate(
    sqwiggle_outcome = 
      sqwigglize_margin(home_score_total_score - away_score_total_score),
    home_game_advantage = sqwigglize_hga(home_distance, away_distance)) |> 
  dplyr::select(-contains("byes"))


library(elo)

# Set parameters for model
carry_over = .2
k_val = 40
library(elo)
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
  tibble::tibble(
    "data" =
      purrr::pmap(
        list(2025),
        fitzRoy::fetch_fixture,
        comp = "AFLW",
        source = "AFL")
  ) |> 
  tidyr::unnest(data) |> 
  janitor::clean_names()|> 
  # Add outcome variable using helper function
  dplyr::mutate(
    sqwiggle_outcome = 
      sqwigglize_margin(home_score_total_score - away_score_total_score)) 
  

team_distance =
  arrow::read_parquet(file = "./data/team_distance.parquet") 

season_2025 =
  # Add home team distances
  season_2025 |> 
  dplyr::left_join(
    team_distance |> 
      dplyr::rename(
        "home_team_club_name" = team_club_name,
        "home_distance"= venue_distance),
    by = dplyr::join_by(home_team_club_name, venue_location, venue_state)) |> 
  dplyr::left_join(
    team_distance |> 
      dplyr::rename(
        "away_team_club_name" = team_club_name,
        "away_distance"= venue_distance),
    by = dplyr::join_by(away_team_club_name, venue_location, venue_state)) |> 
  dplyr::mutate(
    home_game_advantage = sqwigglize_hga(home_distance, away_distance))
  
# Generate start of season tips
start_predict = 
  season_2025 |> 
  dplyr::filter(round_round_number < 13) |> 
  dplyr::mutate(
    prediction = 
      predict(
        sqwiggle_elo_2025, 
        newdata = season_2025 |> 
          dplyr::filter(round_round_number < 13)))

start_tip_tbl =
  start_predict|> 
  dplyr::select(
    round_round_number,
    tidyselect::contains("club_name"), 
    prediction, 
    home_game_advantage) |>
  dplyr::mutate(
    margin_predicted = 
      round(
        unsqwiggle_outcome(prediction) + home_game_advantage ,0),
    tip = 
      sqwiggle_tip(
        .margin = margin_predicted ,
        .hga =  home_game_advantage,
        home_team = home_team_club_name,
        away_team = away_team_club_name))


# Create shells for round by round data
tips_2025 = tibble::tibble()
wins_2025 = tibble::tibble()

sqwiggles_2025 = 
  final.elos(sqwiggle_elo_2025) |>
  tibble::enframe(name = "team_club_name") |> 
  dplyr::arrange(desc(value)) |> 
  dplyr::mutate(round_number = 0)





# Generate tips for season to date round by round

last_round = 
  season_2025 |>  
  dplyr::filter(status %in% c("CONCLUDED")) |> 
  tail(1) |> 
  dplyr::pull(round_round_number)
  

for(.round in 1:last_round) {
  
  # Get data for current round
  round_data = season_2025 |> 
    dplyr::filter(round_round_number == .round)
  
  # Run predictions
  round_predict = 
    round_data|> 
    dplyr::mutate(
      prediction = 
        predict(
          sqwiggle_elo_2025, 
          newdata = round_data))
  
  # Convert to tips
  tip_tbl = 
    round_predict |> 
    dplyr::select(
      round_round_number, 
      tidyselect::contains("club_name"), 
      prediction,
      home_game_advantage) |>
    dplyr::mutate(
      margin_predicted = 
        round(
          unsqwiggle_outcome(prediction) + 
            home_game_advantage,0),
      tip = 
        sqwiggle_tip(
          .margin = margin_predicted ,
          .hga = home_game_advantage,
          home_team = home_team_club_name,
          away_team = away_team_club_name))
  
  tips_2025 = 
    dplyr::bind_rows(
      tips_2025,
      tip_tbl)
  
  # Get winners
  winner_tbl = 
    round_predict |> 
    dplyr::mutate(
      margin = 
        home_score_total_score - away_score_total_score,
      winner = 
        sqwiggle_winner(
          .margin = margin,
          home_team = home_team_club_name,
          away_team = away_team_club_name)) |> 
    dplyr::select(
      round_round_number, 
      tidyselect::contains("club_name"), 
      winner)
  
  wins_2025 = 
    dplyr::bind_rows(
      wins_2025, 
      winner_tbl)
  
  #Update model to incorporate tipped round
  model_data = 
    dplyr::bind_rows(
      model_data, round_data) |> 
    dplyr::mutate(
      sqwiggle_outcome = 
        sqwigglize_margin(
          home_score_total_score - away_score_total_score))
  
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
    tibble::enframe(name = "team_club_name") |> 
    dplyr::arrange(desc(value)) |> 
    dplyr::mutate(round_number = .round)
  
  sqwiggles_2025 = 
    dplyr::bind_rows(
      sqwiggles_2025,
      round_sqwiggles)  
}


