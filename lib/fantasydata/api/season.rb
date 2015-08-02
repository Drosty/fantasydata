require 'fantasydata/api/utils'

module Fantasydata
  module API
    module Season
      include Fantasydata::API::Utils

      def current_season
        integer_from_response(:get, '/nfl/v2/JSON/CurrentSeason')
      end

      def last_completed_season
        integer_from_response(:get, '/nfl/v2/JSON/LastCompletedSeason')
      end

      def upcoming_season
        integer_from_response(:get, '/nfl/v2/JSON/UpcomingSeason')
      end

    end
  end
end
