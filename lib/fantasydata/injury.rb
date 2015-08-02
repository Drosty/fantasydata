require 'fantasydata/base'

module Fantasydata
  class Injury < Fantasydata::Base
    attr_reader :injury_id, :season_type, :season, :week, 
                :player_id, :name, :position, :number, :team, 
                :opponent, :body_part, :status, :practice, 
                :practice_description, :updated, :declared_inactive

  end
end


