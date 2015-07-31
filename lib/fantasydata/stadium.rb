require 'fantasydata/base'

module Fantasydata
  class Stadium < Fantasydata::Base
    attr_reader :stadium_id, :name, :city, :state, 
                :country, :capacity, :playing_surface

  end
end
