require 'fantasydata/base'

module Fantasydata
  module Boxscore
    class ReceivingStat < Fantasydata::Base
      attr_reader :player_game_id, :player_id, :short_name, :name, :team, 
                  :number, :position, :position_category, :fantasy_position, 
                  :fantasy_points, :updated, :fumbles_lost, :receiving_long, 
                  :receiving_targets, :receiving_touchdowns, :receiving_yards, 
                  :receiving_yards_per_reception, :receiving_yards_per_target, 
                  :reception_percentage, :receptions, :two_point_conversion_receptions
       
    end
  end
end
