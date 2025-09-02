#' Function to normalise AFLW margins to ELO outcomes
#'
#'
#' @param margin the winning margin of an AFLW match, an integer
#' @param range_max the maximum margin used for normalisation
#' @param range_min the minimum margin used for normalisation 


sqwigglize_margin =
  function(
    margin,
    range_max = 100, 
    range_min = -100) {
  
  norm = (margin -  range_min) / (range_max -  range_min)
  norm = norm |> 
    pmin(1) |> 
    pmax(0)
  
  return(norm)
  }

#' Function to convert AFLW ELO outcomes to margins
#'
#'
#' @param outcome the model prediction of an AFLW match, an integer
#' @param range_max the maximum margin used for normalisation
unsqwiggle_outcome = 
  function(
    outcome,
    range_max = 100
  ){
    margin = ((outcome -.5) * range_max) |> round()
    return(margin)
  }

sqwiggle_tip =
  function(
    .prediction = prediction,
    home_team = home_team_club_name,
    away_team = away_team_club_name) {
    
    tip = if_else(
      .prediction >= .5,
      home_team, 
      away_team
    )
    
    return(tip)
  }

sqwiggle_winner =
  function(
    .outcome = sqwiggle_outcome,
    home_team = home_team_club_name,
    away_team = away_team_club_name) {
    
    winner = if_else(
      .outcome > .5,
      home_team, 
      if_else(
        .outcome  == .5,
        "Draw",
        away_team)
    )
    
    return(winner)
  }
