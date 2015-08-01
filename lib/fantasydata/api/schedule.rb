require 'fantasydata/api/utils'

module Fantasydata
  module API
    module Schedule
      include Fantasydata::API::Utils

      def schedule_by_year year
        objects_from_response(Fantasydata::Schedule, :get, "/nfl/v2/JSON/Schedules/#{year}")
      end
    end
  end
end
