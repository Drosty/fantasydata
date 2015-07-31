require 'fantasydata/api/utils'

module Fantasydata
  module API
    module PlayerStat
      include Fantasydata::API::Utils

      def player_stat_by_week year, week, player_id
        object_from_response(Fantasydata::PlayerStat, :get, "/nfl/v2/JSON/PlayerGameStatsByPlayerID/#{year}/#{week}/#{player_id}")
      end

      def player_stat_by_week_projection year, week, player_id
        object_from_response(Fantasydata::PlayerStat, :get, "/nfl/v2/JSON/PlayerGameProjectionStatsByPlayerID/#{year}/#{week}/#{player_id}")
      end

      def player_stat_by_week_and_team year, week, team_name
        objects_from_response(Fantasydata::PlayerStat, :get, "/nfl/v2/JSON/PlayerGameStatsByTeam/#{year}/#{week}/#{team_name}")
      end

      def player_stat_by_week_and_team_projection year, week, team_name
        objects_from_response(Fantasydata::PlayerStat, :get, "/nfl/v2/JSON/PlayerGameProjectionStatsByTeam/#{year}/#{week}/#{team_name}")
      end

    end
  end
end
