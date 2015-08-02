require 'fantasydata/api/utils'

module Fantasydata
  module API
    module Week
      include Fantasydata::API::Utils

      def current_week
        integer_from_response(:get, '/nfl/v2/JSON/CurrentWeek')
      end

      def last_completed_week
        integer_from_response(:get, '/nfl/v2/JSON/LastCompletedWeek')
      end

      def upcoming_week
        integer_from_response(:get, '/nfl/v2/XML/UpcomingWeek')
      end

    end
  end
end
