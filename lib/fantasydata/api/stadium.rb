require 'fantasydata/api/utils'

module Fantasydata
  module API
    module Stadium
      include Fantasydata::API::Utils

      def stadiums
        objects_from_response(Fantasydata::Stadium, :get, "/nfl/v2/JSON/Stadiums")
      end

    end
  end
end
