require 'fantasydata/base'

module Fantasydata
  class Schedule < Fantasydata::Base
    attr_reader :game_key, :season_type, :season, :week, :date, 
                :away_team, :home_team, :channel, :point_spread, 
                :over_under, :stadium_id

    def stadium
      @stadium ||= Fantasydata::Stadium.new(@attrs[:stadium_details])
    end
    
  end
end
