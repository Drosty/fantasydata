require 'fantasydata/api/utils'

module Fantasydata
  module API
    module Standings
      include Fantasydata::API::Utils

      def standings_by_year year
        objects_from_response(Fantasydata::Standings, :get, "/nfl/v2/JSON/Standings/#{year}")
      end

    end
  end
end
