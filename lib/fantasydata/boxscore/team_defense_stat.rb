require 'fantasydata/base'

module Fantasydata
  module Boxscore
    class TeamDefenseStat < Fantasydata::Base
      attr_reader :scoring_details, :game_key, :season_type, :season, :week, 
                  :date, :team, :opponent, :points_allowed, :touchdowns_scored, 
                  :solo_tackles, :assisted_tackles, :sacks, :sack_yards, 
                  :passes_defended, :fumbles_forced, :fumbles_recovered, 
                  :fumble_return_yards, :fumble_return_touchdowns, :interceptions, 
                  :interception_return_yards, :interception_return_touchdowns, 
                  :blocked_kicks, :safeties, :punt_returns, :punt_return_yards, 
                  :punt_return_touchdowns, :punt_return_long, :kick_returns, 
                  :kick_return_yards, :kick_return_touchdowns, :kick_return_long, 
                  :blocked_kick_return_touchdowns, :field_goal_return_touchdowns, 
                  :fantasy_points_allowed, :quarterback_fantasy_points_allowed, 
                  :runningback_fantasy_points_allowed, 
                  :wide_receiver_fantasy_points_allowed, 
                  :tight_end_fantasy_points_allowed, :kicker_fantasy_points_allowed, 
                  :blocked_kick_return_yards, :field_goal_return_yards, 
                  :quarterback_hits, :tackles_for_loss, :defensive_touchdowns, 
                  :special_teams_touchdowns, :is_game_over, :fantasy_points, 
                  :stadium, :temperature, :humidity, :wind_speed, :third_down_attempts, 
                  :third_down_conversions, :fourth_down_attempts, 
                  :fourth_down_conversions, :points_allowed_by_defense_special_teams, 
                  :fan_duel_salary, :draft_kings_salary, :fantasy_data_salary, 
                  :victiv_salary
    end
  end
end
