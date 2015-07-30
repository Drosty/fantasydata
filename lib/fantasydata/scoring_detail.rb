require 'fantasydata/base'

module Fantasydata
  class ScoringDetail < Fantasydata::Base
    attr_reader :game_key, :season_type, :player_id, :team, 
                :season, :week, :scoring_type, :length, 
                :scoring_detail_id, :player_game_id

  end
end
