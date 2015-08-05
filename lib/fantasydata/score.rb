require 'fantasydata/base'

module Fantasydata
  class Score < Fantasydata::Base
    attr_reader :game_key, :season_type, :season, :week, :date, :away_team, 
                :home_team, :away_score, :home_score, :channel, :point_spread, 
                :over_under, :quarter, :time_remaining, :possession, :down, 
                :distance, :yard_line, :yard_line_territory, :red_zone, 
                :away_score_quarter1, :away_score_quarter2, :away_score_quarter3, 
                :away_score_quarter4, :away_score_overtime, :home_score_quarter1, 
                :home_score_quarter2, :home_score_quarter3, :home_score_quarter4, 
                :home_score_overtime, :has_started, :is_in_progress, :is_over, 
                :has1st_quarter_started, :has2nd_quarter_started, 
                :has3rd_quarter_started, :has4th_quarter_started, :is_overtime, 
                :down_and_distance, :quarter_description, :stadium_id, :last_updated

    def stadium
      @stadium ||= Fantasydata::Stadium.new(@attrs[:stadium_details])
    end
    
  end
end
