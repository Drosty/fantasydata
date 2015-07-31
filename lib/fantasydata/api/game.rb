require 'fantasydata/api/utils'

module Fantasydata
  module API
    module Game
      include Fantasydata::API::Utils

      # Returns true if there is at least one game being played at the time of the request or false if there are none.
      #
      # @see https://developer.fantasydata.com/docs/services/556a892e35491a1d30c7a8ba/operations/556a892f35491a02d05ebf3d
      # @authentication Requires api key
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [boolean]
      #
      # @example games_in_progress
      #   Fantasydata.games_in_progress?
      def games_in_progress?()
        boolean_from_response(:get, '/nfl/v2/JSON/AreAnyGamesInProgress')
      end

      def game_stats_by_week(year, week)
        objects_from_response(Fantasydata::GameStat, :get, "/nfl/v2/JSON/GameStatsByWeek/#{year}/#{week}")
      end
    end
  end
end
