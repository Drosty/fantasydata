require 'fantasydata/api/utils'

module Fantasydata
  module API
    module Score
      include Fantasydata::API::Utils

      def scores_by_season year
        objects_from_response(Fantasydata::Score, :get, "/nfl/v2/JSON/Scores/#{year}")
      end
    end
  end
end
