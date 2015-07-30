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

      def player_details_by_id(id)
      end

    end
  end
end
