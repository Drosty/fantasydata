require 'fantasydata/api/utils'

module Fantasydata
  module API
    module LeagueLeaders
      include Fantasydata::API::Utils

      def league_leaders_by_season(year, position, stat_column)
        objects_from_response(Fantasydata::PlayerSeasonStat, :get, "/nfl/v2/JSON/SeasonLeagueLeaders/#{year}/#{position.upcase}/#{stat_column}")
      end

    end
  end
end
