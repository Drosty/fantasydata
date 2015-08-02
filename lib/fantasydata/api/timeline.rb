require 'fantasydata/api/utils'

module Fantasydata
  module API
    module Timeline
      include Fantasydata::API::Utils

      def current_timeline
        objects = objects_from_response(Fantasydata::Timeline, :get, "/nfl/v2/JSON/Timeframes/current")
        objects.first
      end

      def upcoming_timelines
        objects = objects_from_response(Fantasydata::Timeline, :get, "/nfl/v2/JSON/Timeframes/upcoming")
      end

      def completed_timelines
        objects = objects_from_response(Fantasydata::Timeline, :get, "/nfl/v2/JSON/Timeframes/completed")
      end

      def recent_timelines
        objects = objects_from_response(Fantasydata::Timeline, :get, "/nfl/v2/JSON/Timeframes/recent")
      end

      def all_timelines
        objects = objects_from_response(Fantasydata::Timeline, :get, "/nfl/v2/JSON/Timeframes/all")
      end

    end
  end
end
