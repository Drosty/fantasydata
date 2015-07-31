require 'fantasydata/api/utils'

module Fantasydata
  module API
    module News
      include Fantasydata::API::Utils

      def news_by_player_id(player_id)
        objects_from_response(Fantasydata::News, :get, "/nfl/v2/XML/NewsByPlayerID/#{player_id}")
      end

      def news_by_team(team_name)
        objects_from_response(Fantasydata::News, :get, "/nfl/v2/JSON/NewsByTeam/#{team_name}")
      end

      def news_recent
        objects_from_response(Fantasydata::News, :get, "/nfl/v2/JSON/News")
      end

    end
  end
end
