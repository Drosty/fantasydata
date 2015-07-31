require 'fantasydata/api/utils'

module Fantasydata
  module API
    module Team
      include Fantasydata::API::Utils

      def teams_active
        objects_from_response(Fantasydata::TeamDetail, :get, "/nfl/v2/JSON/Teams")
      end

    end
  end
end
