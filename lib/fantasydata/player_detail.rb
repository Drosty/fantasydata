require 'fantasydata/base'

module Fantasydata
  class PlayerDetail < Fantasydata::Base
    attr_reader :player_id, :team, :number, :first_name, :last_name, 
                :position, :status, :height, :weight, :birth_date, :college, 
                :experience, :fantasy_position, :active, :position_category, 
                :name, :age, :experience_string, :birth_date_string, :photo_url, 
                :bye_week, :upcoming_game_opponent, :upcoming_game_week, 
                :short_name, :average_draft_position, :depth_position_category, 
                :depth_position, :depth_order, :depth_display_order, :current_team,
                :college_draft_team, :college_draft_year, :college_draft_round, 
                :college_draft_pick, :is_undrafted_free_agent, :height_feet, 
                :height_inches, :upcoming_opponent_rank, :upcoming_opponent_position_rank, 
                :current_status, :upcoming_salary

    # @return [Fantasydata::DocCounts]
    def season_stats
      @season_stats ||= Fantasydata::SeasonStats.new(@attrs[:player_season])
    end

    def latest_news
      @latest_news ||= map_collection(Fantasydata::News, :latest_news)
    end

  end
end
