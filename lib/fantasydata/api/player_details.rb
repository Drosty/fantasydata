require 'fantasydata/api/utils'

module Fantasydata
  module API
    module PlayerDetails
      include Fantasydata::API::Utils

      def player_details_available
        objects_from_response(Fantasydata::PlayerDetail, :get, "/nfl/v2/JSON/Players")
      end

      def player_details_free_agents
        objects_from_response(Fantasydata::PlayerDetail, :get, "/nfl/v2/JSON/FreeAgents")
      end

      def player_details_by_team(team_name)
      end

      def player_details_by_player_id(player_id)
        object_from_response(Fantasydata::PlayerDetail, :get, "/nfl/v2/JSON/Player/#{player_id.to_s}")
      end

    end
  end
end
