require 'fantasydata/base'

module Fantasydata
  module Boxscore
    class PuntingStat < Fantasydata::Base
      attr_reader :player_game_id, :player_id, :short_name, :name, :team, 
                  :number, :position, :position_category, :fantasy_position, 
                  :fantasy_points, :updated, :punt_average, :punt_inside20, 
                  :punt_touchbacks, :punt_yards, :punts
    end
  end
end
