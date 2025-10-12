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
  
  norm_margin = (margin -  range_min) / (range_max -  range_min)
  norm_margin = norm_margin |> 
    pmin(1) |> 
    pmax(0)
  
  return(norm_margin)
  }

#' Function to normalise AFLW margins to ELO outcomes
#'
#'
#' @param home_distance home team's travel distance
#' @param away_distance away team's travel distance
#' @param adv_max the maximum distance advantage
#' @param scale weighting applied to normalised advantage

sqwigglize_hga =
  function(
    home_distance,
    away_distance,
    adv_max = 15, 
    scale = 5) {
    
    hga = away_distance - home_distance
    
    norm_hga = hga  / adv_max
    norm_hga = norm_hga |> 
      pmin(1) |> 
      pmax(0)
    
    norm_hga = norm_hga * scale
    
    return(norm_hga)
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
    .margin = margin,
    home_team = home_team_club_name,
    away_team = away_team_club_name) {
    
    tip = if_else(
      .margin >= 0,
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


library(vpstheme)
team_colours = 
  list(
    "Adelaide Crows" = bv.sunshine,
    "Brisbane Lions" = bv.red,
    "Carlton" = bv.navy,      
    "Collingwood" = bv.charcoal,      
    "Essendon" = bv.black,        
    "Fremantle" = bv.purple,         
    "GWS GIANTS" = bv.orange,      
    "Geelong Cats" = bv.navy,  
    "Gold Coast SUNS" = bv.musk,
    "Hawthorn"         = bv.maroon,  
    "Melbourne"        = bv.navy,  
    "North Melbourne"   = bv.cerulean, 
    "Port Adelaide" = bv.teal,     
    "Richmond" = bv.yellow,         
    "St Kilda" = bv.smoke,           
    "Sydney Swans" = bv.rose,       
    "West Coast Eagles" = bv.royal ,
    "Western Bulldogs" = bv.cobalt
)
