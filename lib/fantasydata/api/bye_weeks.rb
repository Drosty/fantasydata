require 'fantasydata/api/utils'

module Fantasydata
  module API
    module ByeWeeks
      include Fantasydata::API::Utils

      # Get bye weeks for the teams during a specified NFL season.
      #
      # @see https://developer.fantasydata.com/docs/services/556a892e35491a1d30c7a8ba/operations/556a892f35491a02d05ebf42
      # @authentication Requires api key
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Fantasydata::BoxScore]
      # @param season [String] Year of the season and the season type. If no season type is provided, then the default is regular season Examples: 2015REG, 2015PRE, 2015POST, 2015
      # @example bye_weeks_for_season
      #   Fantasydata.bye_weeks_for_season('2015REG')
      def bye_weeks_for_season(season)
        objects_from_response(Fantasydata::ByeWeek, :get, "/nfl/v2/JSON/Byes/#{season}")
      end

    end
  end
end
