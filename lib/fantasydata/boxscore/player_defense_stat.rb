require 'fantasydata/base'

module Fantasydata
  module Boxscore
    class PlayerDefenseStat < Fantasydata::Base
      attr_reader :player_game_id, :player_id, :short_name, :name, :team, 
                  :number, :position, :position_category, :fantasy_position, 
                  :fantasy_points, :updated, :assisted_tackles, 
                  :fumble_return_touchdowns, :fumbles_forced, :fumbles_recovered, 
                  :interception_return_touchdowns, :interception_return_yards, 
                  :interceptions, :passes_defended, :quarterback_hits, :sack_yards, 
                  :sacks, :solo_tackles, :tackles, :tackles_for_loss
    end
  end
end
