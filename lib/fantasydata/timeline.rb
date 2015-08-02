require 'fantasydata/base'

module Fantasydata
  class Timeline < Fantasydata::Base
    attr_reader :season_type, :season, :week, :name, :short_name, 
                :start_date, :end_date, :first_game_start, 
                :first_game_end, :last_game_end, :has_games, 
                :has_started, :has_ended, :has_first_game_started, 
                :has_first_game_ended, :has_last_game_ended

  end
end
