source("./r/sqwiggle_helpers.R")

# Extract pre-2025 fixtures to build starting model
model_data_m =
  arrow::read_parquet(file = "./data/fixture_history_m.parquet") |> 
  # Add outcome variable using helper function
  dplyr::mutate(
    sqmiggle_outcome = 
      sqwigglize_margin(home_score_total_score - away_score_total_score),
    home_game_advantage = sqwigglize_hga(home_distance, away_distance)) 


library(elo)

# Set parameters for model
carry_over = .15

k_val = 30

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
  tibble::tibble(
    "data" =
      purrr::pmap(
        list(2026),
        fitzRoy::fetch_fixture,
        comp = "AFLM",
        source = "AFL")
  ) |> 
  tidyr::unnest(data) |> 
  janitor::clean_names() |> 
  dplyr::select(-tidyselect::contains("byes"))

team_distance_m =
  arrow::read_parquet(file = "./data/team_distance_m.parquet") 

season_2026_m =
  # Add home team distances
  season_2026_m |> 
  dplyr::left_join(
    team_distance_m |> 
      dplyr::rename(
        "home_team_club_name" = team_club_name,
        "home_distance"= venue_distance)) |> 
  dplyr::left_join(
    team_distance_m |> 
      dplyr::rename(
        "away_team_club_name" = team_club_name,
        "away_distance"= venue_distance)) |> 
  dplyr::mutate(home_game_advantage = sqwigglize_hga(home_distance, away_distance))

# Generate start of season tips
start_predict_m = 
  season_2026_m |>  
  dplyr::mutate(
    prediction = 
      stats::predict(
        sqmiggle_elo_2026, 
        newdata = season_2026_m))

start_tip_tbl_m =
  start_predict_m |> 
  dplyr::select(
    round_round_number, 
    tidyselect::contains("club_name"), 
    prediction, home_game_advantage) |>
  dplyr::mutate(
    margin_predicted = 
      round(
        unsqwiggle_outcome(prediction) + 
          home_game_advantage,
        0),
    tip = sqwiggle_tip(
      .margin = margin_predicted ,
      home_team = home_team_club_name,
      away_team = away_team_club_name))


# Create shells for round by round data
tips_2026_m = tibble::tibble()
wins_2026_m = tibble::tibble()

sqmiggles_2026 = 
  tibble::enframe(
    final.elos(sqmiggle_elo_2026))|>
  dplyr::rename(
    "team_club_name" = name
  ) |> 
  dplyr::arrange(
    desc(value)) |> 
  dplyr::mutate(
    round_number = -1)

# Generatetibble()# Generate tips for season to date round by round
last_round = 
  season_2026_m |>  
  dplyr::filter(status %in% c("CONCLUDED")) |> 
  tail(1) |> 
  dplyr::pull(round_round_number)



if(rlang::is_empty(last_round)){last_round = 0}

if(last_round > -1){
  # Add outcome variable using helper function
  season_2026_m =
    season_2026_m|> 
    dplyr::mutate(
      sqwiggle_outcome = 
        sqwigglize_margin(home_score_total_score - away_score_total_score)) 
}


for(.round in 0:last_round) {
  
  # Get data for current round
  round_data = season_2026_m |> 
    dplyr::filter(round_round_number == .round)
  
  # Run predictions
  round_predict = 
    round_data|> 
    dplyr::mutate(
      prediction = 
        stats::predict(
          sqmiggle_elo_2026, 
          newdata = round_data))
  
  # Convert to tips
  tip_tbl = 
    round_predict |> 
    dplyr::select(
      round_round_number, 
      tidyselect::contains("club_name"), 
      prediction, home_game_advantage) |>
    dplyr::mutate(
      margin_predicted = 
        round(unsqwiggle_outcome(prediction) +
                home_game_advantage, 0),
      tip = 
        sqwiggle_tip(
          .margin = margin_predicted ,
          home_team = home_team_club_name,
          away_team = away_team_club_name))
  
  tips_2026_m = 
    dplyr::bind_rows(
      tips_2026_m,
      tip_tbl)
  
  if(.round > -1) {
  # Get winners
  winner_tbl = 
    round_predict |> 
    dplyr::mutate(
      margin = 
        home_score_total_score - 
        away_score_total_score,
      winner = 
        sqwiggle_winner(
          .margin = margin,
          home_team = home_team_club_name,
          away_team = away_team_club_name)) |> 
    dplyr::select(
      round_round_number,
      tidyselect::contains("club_name"), 
      winner)
  
  wins_2026_m = 
    dplyr::bind_rows(
      wins_2026_m, 
      winner_tbl)
  }
  #Update model to incorporate tipped round
  model_data_m = 
    dplyr::bind_rows(
      model_data_m, 
      round_data) |> 
    dplyr::mutate(
      sqmiggle_outcome = 
        sqwigglize_margin(
          home_score_total_score - 
            away_score_total_score))
  
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
    tibble::enframe(name = "team_club_name") |> 
    dplyr::arrange(desc(value)) |> 
    dplyr::mutate(round_number = .round)
  
  sqmiggles_2026 = 
    dplyr::bind_rows(
      sqmiggles_2026,
      round_sqmiggles)  
}

# Get data for future rounds
future_data = 
  season_2026_m |> 
  dplyr::filter(round_round_number > last_round)

# Run predictions
future_predict = 
  future_data |> 
  dplyr::mutate(prediction = 
           predict(
             sqmiggle_elo_2026,
             newdata = future_data))

# Convert to tips
tip_tbl = 
  future_predict |> 
  dplyr::select(
    round_round_number,
    tidyselect::contains("club_name"), 
    prediction, home_game_advantage) |>
  dplyr::mutate(
    margin_predicted = round(unsqwiggle_outcome(prediction)+home_game_advantage,0),
         tip = sqwiggle_tip(.margin = margin_predicted,
                            home_team = home_team_club_name,
                            away_team = away_team_club_name))

tips_2026_m = 
  dplyr::bind_rows(
    tips_2026_m,
    tip_tbl)

tipping_results =
  tips_2026_m

if(nrow(wins_2026_m) > 0) {
  tipping_results =
    dplyr::left_join(
      wins_2026_m,
      tipping_results,
      by = 
        dplyr::join_by(
          round_round_number,
          home_team_club_name,
          away_team_club_name)
  ) |> 
  dplyr::mutate(
    correct = as.integer(tip==winner)) |> 
  dplyr::group_by(round_round_number) |> 
  dplyr::mutate(round_score = sum(correct))
} else {
  tipping_results = 
    tipping_results |> 
    dplyr::mutate(correct = 0) |> 
    dplyr::group_by(round_round_number) |> 
    dplyr::mutate(round_score = sum(correct))
}

# Calculate opponent strength

opponents = 
  season_2026_m |> 
  dplyr::select(
    id, round_round_number, 
    tidyselect::contains("team_club_name")) |> 
  tidyr::pivot_longer(
    tidyselect::contains("team_club_name"), 
    values_to = "team") 

oppo_strength = 
  opponents |> 
  dplyr::left_join(
    opponents |> 
      dplyr::rename("opponent"="team"),
    by = dplyr::join_by("id", "round_round_number")
  ) |> 
  dplyr::filter(
    team!=opponent
  ) |> 
  dplyr::select(
    "round_number" = round_round_number, team, opponent
  ) |> 
  dplyr::left_join(
    sqmiggles_2026 |> 
      dplyr::mutate(round_number = round_number + 1) |> 
      dplyr::rename("opponent" = team_club_name),
    by = dplyr::join_by("round_number", "opponent")
  ) |> 
  dplyr::group_by(
    team
  ) |> 
  dplyr::arrange(team, round_number) |> 
  tidyr::fill(value) |> 
  dplyr::filter(!is.na(value)) |> 
  dplyr::summarise(
    total = sum(value)/dplyr::n(),
    .groups = "drop"
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
  dplyr::select(
    team_club_name,
    round_number,
    "position_current" = position, 
    "wins_current" = this_season_record_win_loss_record_wins,
    tidyselect::starts_with("points")) 

# Generate predicted ladder 
predicted_ladder =
  start_tip_tbl_m|> 
  dplyr::mutate(team_club_name = tip) |> 
  dplyr::group_by(team_club_name) |> 
  dplyr::summarise(wins_predicted = dplyr::n())

if(last_round > - 1 ){
average_score = 
  season_2026_m |> 
  dplyr::select(
    round_round_number, 
    tidyselect::contains("total_score")) |> 
  tidyr::pivot_longer(
    tidyselect::contains("score")) |> 
  dplyr::summarise(value = mean(value, na.rm = TRUE))
}

percentage_adjustment = 
  start_tip_tbl_m |> 
  dplyr::select(
    tidyselect::contains("team"),
    margin_predicted) |> 
  tidyr::pivot_longer(
    tidyselect::contains("team"), 
    values_to = "team_club_name",
    names_transform = \(x) stringr::str_remove(x, "_team.*")) |> 
  dplyr::mutate(
    adjustment_sign = dplyr::if_else(name == "home",1,-1),
    adjustment = adjustment_sign*margin_predicted) |> 
  dplyr::group_by(team_club_name) |> 
  dplyr::summarise(adjustment = sum(adjustment))

# Combine and format
combined_ladder =
  dplyr::left_join(
    actual_ladder,
    predicted_ladder
  ) |> 
  dplyr::mutate(
    wins_predicted = pmax(wins_predicted,0, na.rm = TRUE)) |> 
  dplyr::left_join(
    percentage_adjustment) |> 
  dplyr::mutate(
    percentage = (points_for+adjustment)/points_against*100) |> 
  dplyr::arrange(
    desc(wins_predicted), 
    desc(percentage)) |> 
  dplyr::mutate(position_predicted = 1:18) |> 
  dplyr::left_join(sqmiggles_2026) |> 
  dplyr::arrange(desc(value)) |> 
  dplyr::mutate(position_model = 1:18) |>
  dplyr::select(
    team_club_name,
    tidyselect::starts_with("wins"),
    tidyselect::starts_with("position")
  ) |> 
  dplyr::arrange(position_current) |> 
  dplyr::mutate(
    position_change = 
      position_predicted - position_current) |> 
  dplyr::left_join(
    oppo_strength |>
      dplyr::rename(
        "team_club_name" = team,
        "opposition_strength" = total)
  )

