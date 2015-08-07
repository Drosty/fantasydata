require 'fantasydata/base'

module Fantasydata
  module Boxscore
    class KickingStat < Fantasydata::Base
      attr_reader :player_game_id, :player_id, :short_name, :name, :team, 
                  :number, :position, :position_category, :fantasy_position, 
                  :fantasy_points, :updated, :extra_points_attempted, 
                  :extra_points_made, :field_goal_percentage, 
                  :field_goals_attempted, :field_goals_longest_made, :field_goals_made
    end
  end
end
