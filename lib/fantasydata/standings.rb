require 'fantasydata/base'

module Fantasydata
  class Standings < Fantasydata::Base
    attr_reader :season_type, :season, :conference, 
                :division, :team, :name, :wins, 
                :losses, :ties, :percentage, :points_for, 
                :points_against, :net_points, :touchdowns, 
                :division_wins, :division_losses, 
                :conference_wins, :conference_losses

  end
end
