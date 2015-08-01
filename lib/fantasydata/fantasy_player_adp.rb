require 'fantasydata/base'

module Fantasydata
  class FantasyPlayerAdp < Fantasydata::Base
    attr_reader :fantasy_player_key, :player_id, :name, :team, 
                :position, :average_draft_position, 
                :average_draft_position_ppr, :bye_week, 
                :last_season_fantasy_points, :projected_fantasy_points
  end
end
