require 'fantasydata/api/utils'

module Fantasydata
  module API
    module Injury
      include Fantasydata::API::Utils

      def injuries_by_year_and_week year, week
        objects_from_response(Fantasydata::Injury, :get, "/nfl/v2/JSON/Injuries/#{year}/#{week}")
      end

    end
  end
end
