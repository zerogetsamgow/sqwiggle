source("./r/sqwiggle_helpers.R")

# Extract pre-2025 fixtures to build starting model
model_data_w =
  arrow::read_parquet(file = "./data/fixture_history_w.parquet") |> 
  dplyr::filter_out(utc_start_time < lubridate::ymd("2025-1-1")) |> 
  # Add outcome variable using helper function
  dplyr::mutate(
    sqwiggle_outcome = 
      sqwigglize_margin(home_score_total_score - away_score_total_score),
    home_game_advantage = 
      sqwigglize_hga(home_distance, away_distance)) 


library(elo)

# Set parameters for model
carry_over = .2

k_function = function(round) {
  
  dplyr::case_when(
    round < 8 ~ 40,
    round < 16 ~ 30,
    TRUE ~ 20
    )
  
}

# Build model
sqwiggle_elo_2026 = 
  elo.run(
    sqwiggle_outcome ~
      adjust(home_team_club_name, home_game_advantage) +
      away_team_club_name +
      regress(comp_season_name, 1500, carry_over) +
      group(round_provider_id),
    k = 40,
    data = model_data_w) 

# Get current season data
season_2026_w = 
  tibble::tibble(
    "data" =
      purrr::pmap(
        list(2026),
        fitzRoy::fetch_fixture,
        comp = "AFLW",
        source = "AFL")
  ) |> 
  tidyr::unnest(data) |> 
  janitor::clean_names() |> 
  dplyr::select(-tidyselect::contains("byes"))

team_distance_w =
  arrow::read_parquet(file = "./data/team_distance_w.parquet") 

season_2026_w =
  # Add home team distances
  season_2026_w |> 
  dplyr::left_join(
    team_distance_w |> 
      dplyr::rename(
        "home_team_club_name" = team_club_name,
        "home_distance"= venue_distance)) |> 
  dplyr::left_join(
    team_distance_w |> 
      dplyr::rename(
        "away_team_club_name" = team_club_name,
        "away_distance"= venue_distance)) |> 
  dplyr::mutate(
    home_game_advantage =
      sqwigglize_hga(home_distance, away_distance))

# Generate start of season tips
start_predict_w = 
  season_2026_w |>  
  dplyr::mutate(
    prediction = 
      stats::predict(
        sqwiggle_elo_2026, 
        newdata = season_2026_w))

start_tip_tbl_w =
  start_predict_w |> 
  dplyr::select(
    round_round_number, 
    tidyselect::contains("club_name"), 
    prediction, 
    home_game_advantage) |>
  dplyr::mutate(
    margin_predicted = 
      round(
        unsqwiggle_outcome(prediction) + 
          (home_game_advantage),
        0),
    tip = sqwiggle_tip(
      .margin = margin_predicted ,
      home_team = home_team_club_name,
      away_team = away_team_club_name))


# Create shells for round by round data
tips_2026_w = tibble::tibble()
wins_2026_w = tibble::tibble()

sqwiggles_2026 = 
  tibble::enframe(
    final.elos(sqwiggle_elo_2026))|>
  dplyr::rename(
    "team_club_name" = name
  ) |> 
  dplyr::arrange(
    desc(value)) |> 
  dplyr::mutate(
    round_number = -1)

# Generatetibble()# Generate tips for season to date round by round
last_round_w = 
  season_2026_w |>  
  dplyr::filter(status %in% c("CONCLUDED")) |> 
  tail(1) |> 
  dplyr::pull(round_round_number)



if(rlang::is_empty(last_round_w)){last_round_w = 0}

if(last_round_w > 0){
  # Add outcome variable using helper function
  season_2026_w =
    season_2026_w|> 
    dplyr::mutate(
      sqwiggle_outcome = 
        sqwigglize_margin(
          home_score_total_score - away_score_total_score)) 
}


for(.round in 1:(last_round_w + 1)) {
  
  # Get data for current round
  round_data = season_2026_w |> 
    dplyr::filter(round_round_number == .round)
  
  # Run predictions
  round_predict = 
    round_data |> 
    dplyr::mutate(
      prediction = 
        stats::predict(
          sqwiggle_elo_2026, 
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
        round(unsqwiggle_outcome(prediction) +
                (home_game_advantage), 0),
      tip = 
        sqwiggle_tip(
          .margin = margin_predicted ,
          home_team = home_team_club_name,
          away_team = away_team_club_name))
  
  tips_2026_w = 
    dplyr::bind_rows(
      tips_2026_w,
      tip_tbl)
  
  if(.round > 1) {
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
  
  wins_2026_w = 
    dplyr::bind_rows(
      wins_2026_w, 
      winner_tbl)
  }
  #Update model to incorporate tipped round
  model_data_w = 
    dplyr::bind_rows(
      model_data_w, 
      round_data) |> 
    dplyr::mutate(
      sqwiggle_outcome = 
        sqwigglize_margin(
          home_score_total_score - 
            away_score_total_score))
  
  sqwiggle_elo_2026 = 
    elo.run(
      sqwiggle_outcome ~
        adjust(
          home_team_club_name, 
          (home_game_advantage)) +
        away_team_club_name +
        regress(comp_season_name, 1500, carry_over) +
        group(round_provider_id),
      k = k_function(.round),
      data = model_data_w)
  
  round_sqwiggles = 
    final.elos(sqwiggle_elo_2026) |>
    tibble::enframe(name = "team_club_name") |> 
    dplyr::arrange(desc(value)) |> 
    dplyr::mutate(round_number = .round)
  
  sqwiggles_2026 = 
    dplyr::bind_rows(
      sqwiggles_2026,
      round_sqwiggles)  
}

# Get data for future rounds
future_data = 
  season_2026_w |> 
  dplyr::filter(round_round_number > (last_round_w+1))

# Run predictions
future_predict = 
  future_data |> 
  dplyr::mutate(prediction = 
           predict(
             sqwiggle_elo_2026,
             newdata = future_data))

# Convert to tips
future_tip_tbl = 
  future_predict |> 
  dplyr::select(
    round_round_number,
    tidyselect::contains("club_name"), 
    prediction, 
    home_game_advantage) |>
  dplyr::mutate(
    margin_predicted = 
      round(unsqwiggle_outcome(prediction) +
              (home_game_advantage ),0),
    tip = 
      sqwiggle_tip(
        .margin = margin_predicted,
        home_team = home_team_club_name,
        away_team = away_team_club_name))

tips_2026_w = 
  dplyr::bind_rows(
    tips_2026_w,
    future_tip_tbl)

cut_off = 0
tipping_results =
  dplyr::bind_rows(
    # Improved model at round 13, by using less old data.
    # Get old tips
   arrow::read_parquet(
      file = "./data/old_model_tips_2.parquet") |> 
      dplyr::filter(
        round_round_number < cut_off) |> 
     dplyr::select(-winner),
    # Use nes tip after round 12
     tips_2026_w |> 
      dplyr::filter_out(
        round_round_number < cut_off
      )
  )
  


if(nrow(wins_2026_w) > 0) {
  tipping_results =
    dplyr::left_join(
      wins_2026_w,
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
  season_2026_w |> 
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
    sqwiggles_2026 |> 
      dplyr::filter(round_number <= last_round_w) |> 
      dplyr::mutate(round_number = round_number) |> 
      dplyr::rename("opponent" = team_club_name),
    by = dplyr::join_by("round_number", "opponent")
  ) |> 
  dplyr::group_by(team) |> 
  dplyr::mutate(
    to_date = sum(value >1500, na.rm =  TRUE)
  )  |> 
  dplyr::group_by(
    opponent
  ) |> 
  dplyr::arrange(opponent, round_number) |> 
  tidyr::fill(value) |> 
  dplyr::filter(!is.na(value)) |> 
  dplyr::group_by(team, to_date) |> 
  dplyr::arrange(team, round_number) |> 
  dplyr::summarise(
    season = (sum(value)/dplyr::n()) - 1500,
    .groups = "drop"
  )


# Get actual ladder_w using fitZroy
actual_ladder_w = 
  fitzRoy::fetch_ladder(
    season = 2026,
  #  round_number = last_round_w,
    comp = "AFLW",
    source = "AFL"
  ) |> 
  janitor::clean_names() |>  
  dplyr::select(
    team_club_name,
    round_number,
    "position_current" = position, 
    "wins_current" = this_season_record_win_loss_record_wins,
    tidyselect::starts_with("points")) 

# Generate predicted ladder_w 
predicted_ladder_w =
  tips_2026_w |> 
#  dplyr::left_join(wins_2026_w) |> 
 # dplyr::mutate(tip = dplyr::coalesce(winner,tip)) |> 
  dplyr::mutate(team_club_name = tip) |> 
  dplyr::group_by(team_club_name) |> 
  dplyr::summarise(wins_predicted = dplyr::n())

if(last_round_w > 0 ){
average_score = 
  season_2026_w |> 
  dplyr::select(
    round_round_number, 
    tidyselect::contains("total_score")) |> 
  tidyr::pivot_longer(
    tidyselect::contains("score")) |> 
  dplyr::summarise(value = mean(value, na.rm = TRUE))
}

percentage_adjustment = 
  start_tip_tbl_w |> 
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
combined_ladder_w =
  dplyr::left_join(
    actual_ladder_w,
    predicted_ladder_w
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
  dplyr::left_join(sqwiggles_2026) |> 
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
       position_current - position_predicted) |> 
  dplyr::left_join(
    oppo_strength |>
      dplyr::rename(
        "team_club_name" = team,
        "opposition_strength" = season,
        "opponents_to_date" = to_date)
  ) |> 
  dplyr::arrange(position_predicted)


cumulative_ladder_w = tibble::tibble()

for (round in 0:last_round_w) {
  round_ladder_w = 
    fitzRoy::fetch_ladder(
      season = 2026,
      round_number = round,
      comp = "AFLM",
      source = "AFL"
    ) |> 
    janitor::clean_names() |>  
    dplyr::select(
      team_club_name,
      round_number,
      position,
      "wins" =  this_season_record_win_loss_record_wins)
  
  cumulative_ladder_w = dplyr::bind_rows(cumulative_ladder_w,round_ladder_w)
  
}

for(round in (last_round_w):12) {
  round_ladder_w =
    cumulative_ladder_w |> 
    dplyr::filter(round_number == round) |> 
    dplyr::bind_rows(
      tips_2026_w |> 
      dplyr::filter(round_round_number == round +1) |> 
      tidyr::pivot_longer(tidyselect::contains('club_name'), values_to = "team_club_name") |>
      dplyr::right_join(
        tibble::tibble(
          "team_club_name"=names(team_colours), 
          round_round_number = round + 1)) |>   
      dplyr::group_by(team_club_name, "round_number" = round_round_number) |> 
      dplyr::summarise(
        win = 
          as.integer(tip == team_club_name) |> 
          dplyr::coalesce(0))) |> 
    dplyr::group_by(team_club_name) |> 
    tidyr::fill(position) |> 
    tidyr::fill(wins) |> 
    dplyr::mutate(wins = wins + win) |> 
    dplyr::filter(round_number == round +1) |> 
    dplyr::group_by(round_number) |> 
    dplyr::arrange(desc(wins), position) |> 
    dplyr::mutate(position = 1:18)
    
  cumulative_ladder_w = dplyr::bind_rows(cumulative_ladder_w, round_ladder_w)
}

cumulative_ladder_w = 
  cumulative_ladder_w |> 
  dplyr::select(
    round_number,
    team_club_name,
    position
  ) |> 
  dplyr::mutate(
    rank = factor(position, levels = 18L:1L)
  )


