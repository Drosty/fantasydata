require 'fantasydata/base'

module Fantasydata
  class DailyFantasyPoints < Fantasydata::Base
    attr_reader :player_id, :name, :fantasy_points, :has_started,
                :is_in_progress, :is_over, :date
  end
end
