require 'fantasydata/base'

module Fantasydata
  module Boxscore
    class PassingStat < Fantasydata::Base
      attr_reader :player_game_id, :player_id, :short_name, :name, :team, 
                  :number, :position, :position_category, :fantasy_position, 
                  :fantasy_points, :updated, :passing_attempts, 
                  :passing_completion_percentage, :passing_completions, 
                  :passing_interceptions, :passing_long, :passing_rating, 
                  :passing_sack_yards, :passing_sacks, :passing_touchdowns, 
                  :passing_yards, :passing_yards_per_attempt, 
                  :passing_yards_per_completion, :two_point_conversion_passes
    end
  end
end
