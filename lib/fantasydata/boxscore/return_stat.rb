require 'fantasydata/base'

module Fantasydata
  module Boxscore
    class ReturnStat < Fantasydata::Base
      attr_reader :player_game_id, :player_id, :short_name, :name, :team, 
                  :number, :position, :position_category, :fantasy_position, 
                  :fantasy_points, :updated, :kick_return_long, 
                  :kick_return_touchdowns, :kick_return_yards, 
                  :kick_return_yards_per_attempt, :kick_returns, 
                  :punt_return_long, :punt_return_touchdowns, 
                  :punt_return_yards, :punt_return_yards_per_attempt, :punt_returns
       
    end
  end
end
