require 'fantasydata/api/utils'

module Fantasydata
  module API
    module Injury
      include Fantasydata::API::Utils

      def injuries_by_year_and_week year, week
        objects_from_response(Fantasydata::Injury, :get, "/nfl/v2/JSON/Injuries/#{year}/#{week}")
      end

      def injuries_by_year_week_team year, week, team
        objects_from_response(Fantasydata::Injury, :get, "/nfl/v2/JSON/Injuries/#{year}/#{week}/#{team}")
      end

    end
  end
end
