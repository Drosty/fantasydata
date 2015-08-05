require 'fantasydata/api/utils'

module Fantasydata
  module API
    module Score
      include Fantasydata::API::Utils

      def scores_by_season year
        objects_from_response(Fantasydata::Score, :get, "/nfl/v2/JSON/Scores/#{year}")
      end

      def scores_by_week year, week
        objects_from_response(Fantasydata::Score, :get, "/nfl/v2/JSON/ScoresByWeek/#{year}/#{week}")
      end

    end
  end
end
