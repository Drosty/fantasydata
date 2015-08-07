require 'fantasydata/base'

module Fantasydata
  module Boxscore
    class ScoringPlay < Fantasydata::Base
      attr_reader :game_key, :season_type, :scoring_play_id, :season, 
                  :week, :away_team, :home_team, :date, :sequence, :team, 
                  :quarter, :time_remaining, :play_description, :away_score, :home_score
    end
  end
end
