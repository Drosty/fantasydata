require 'fantasydata/api/utils'

module Fantasydata
  module API
    module LeagueLeaders
      include Fantasydata::API::Utils

      def league_leaders_by_season(year, position, stat_column)
        objects_from_response(Fantasydata::PlayerSeasonStat, :get, "/nfl/v2/JSON/SeasonLeagueLeaders/#{year}/#{position.upcase}/#{stat_column}")
      end

      def league_leaders_by_week(year, week, position, stat_column)
        objects_from_response(Fantasydata::PlayerGameStat, :get, "/nfl/v2/JSON/GameLeagueLeaders/#{year}/#{week}/#{position.upcase}/#{stat_column}")
      end

    end
  end
end
