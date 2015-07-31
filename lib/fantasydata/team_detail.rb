require 'fantasydata/base'

module Fantasydata
  class TeamDetail < Fantasydata::Base
    attr_reader :key, :team_id, :player_id, 
                :city, :name, :conference, :division, :full_name, 
                :stadium_id, :bye_week, :average_draft_position, 
                :average_draft_position_ppr, :head_coach, 
                :offensive_coordinator, :defensive_coordinator, 
                :special_teams_coach, :offensive_scheme, 
                :defensive_scheme, :upcoming_salary, 
                :upcoming_opponent_rank, :upcoming_opponent_position_rank
    

    def stadium
      @season_stats ||= Fantasydata::Stadium.new(@attrs[:stadium_details])
    end

  end
end
