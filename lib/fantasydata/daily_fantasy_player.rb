require 'fantasydata/base'

module Fantasydata
  class DailyFantasyPlayer < Fantasydata::Base
    attr_reader :player_id, :date, :short_name, :name, :team, :opponent,
                :position, :salary, :last_game_fantasy_points,
                :projected_fantasy_points, :opponent_rank,
                :opponent_position_rank, :status, :status_code, :status_color

  end
end
