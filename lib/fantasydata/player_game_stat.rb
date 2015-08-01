require 'fantasydata/base'

module Fantasydata
  class PlayerGameStat < Fantasydata::Base
    attr_reader :custom_d365_fantasy_points, :game_key, :player_id,
                :season_type, :season, :game_date, :week, :team, :opponent, :home_or_away,
                :number, :name, :position, :position_category, :activated, :played, :started,
                :passing_attempts, :passing_completions, :passing_yards, :passing_completion_percentage,
                :passing_yards_per_attempt, :passing_yards_per_completion, :passing_touchdowns,
                :passing_interceptions, :passing_rating, :passing_long, :passing_sacks,
                :passing_sack_yards, :rushing_attempts, :rushing_yards, :rushing_yards_per_attempt,
                :rushing_touchdowns, :rushing_long, :receiving_targets, :receptions, :receiving_yards,
                :receiving_yards_per_reception, :receiving_touchdowns, :receiving_long, :fumbles,
                :fumbles_lost, :punt_returns, :punt_return_yards, :punt_return_yards_per_attempt,
                :punt_return_touchdowns, :punt_return_long, :kick_returns, :kick_return_yards,
                :kick_return_yards_per_attempt, :kick_return_touchdowns, :kick_return_long,
                :solo_tackles, :assisted_tackles, :tackles_for_loss, :sacks, :sack_yards,
                :quarterback_hits, :passes_defended, :fumbles_forced, :fumbles_recovered,
                :fumble_return_yards, :fumble_return_touchdowns, :interceptions,
                :interception_return_yards, :interception_return_touchdowns, :blocked_kicks,
                :special_teams_solo_tackles, :special_teams_assisted_tackles, :misc_solo_tackles,
                :misc_assisted_tackles, :punts, :punt_yards, :punt_average, :field_goals_attempted,
                :field_goals_made, :field_goals_longest_made, :extra_points_made,
                :two_point_conversion_passes, :two_point_conversion_runs,
                :two_point_conversion_receptions, :fantasy_points, :fantasy_points_ppr,
                :reception_percentage, :receiving_yards_per_target, :tackles, :offensive_touchdowns,
                :defensive_touchdowns, :special_teams_touchdowns, :touchdowns, :fantasy_position,
                :field_goal_percentage, :player_game_id, :fumbles_own_recoveries,
                :fumbles_out_of_bounds, :kick_return_fair_catches, :punt_return_fair_catches,
                :punt_touchbacks, :punt_inside20, :punt_net_average, :extra_points_attempted,
                :blocked_kick_return_touchdowns, :field_goal_return_touchdowns, :safeties,
                :field_goals_had_blocked, :punts_had_blocked, :extra_points_had_blocked, :punt_long,
                :blocked_kick_return_yards, :field_goal_return_yards, :punt_net_yards,
                :special_teams_fumbles_forced, :special_teams_fumbles_recovered, :misc_fumbles_forced,
                :misc_fumbles_recovered, :short_name, :playing_surface, :is_game_over, :safeties_allowed,
                :stadium, :temperature, :humidity, :wind_speed, :fan_duel_salary, :draft_kings_salary,
                :fantasy_data_salary, :offensive_snaps_played, :defensive_snaps_played,
                :special_teams_snaps_played, :offensive_team_snaps, :defensive_team_snaps,
                :special_teams_team_snaps, :victiv_salary

    def scoring_details
      @scoring_details ||= map_collection(Fantasydata::ScoringDetail, :scoring_details)
    end
    
  end
end
