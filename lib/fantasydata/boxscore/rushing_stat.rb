require 'fantasydata/base'

module Fantasydata
  module Boxscore
    class RushingStat < Fantasydata::Base
      attr_reader :player_game_id, :player_id, :short_name, :name, :team, 
                  :number, :position, :position_category, :fantasy_position, 
                  :fantasy_points, :updated, :fumbles_lost, :rushing_attempts, 
                  :rushing_long, :rushing_touchdowns, :rushing_yards, 
                  :rushing_yards_per_attempt, :two_point_conversion_runs

    end
  end
end
