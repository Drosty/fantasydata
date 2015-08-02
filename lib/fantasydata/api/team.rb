require 'fantasydata/api/utils'

module Fantasydata
  module API
    module Team
      include Fantasydata::API::Utils

      def teams_active
        objects_from_response(Fantasydata::TeamDetail, :get, "/nfl/v2/JSON/Teams")
      end

      def teams_by_year year
        objects_from_response(Fantasydata::TeamDetail, :get, "/nfl/v2/JSON/Teams/#{year}")
      end

      def team_game_stats_by_year_and_week year, week
        objects_from_response(Fantasydata::TeamGameStat, :get, "nfl/v2/JSON/TeamGameStats/#{year}/#{week}")
      end

    end
  end
end
