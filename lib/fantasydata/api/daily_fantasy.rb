require 'fantasydata/api/utils'

module Fantasydata
  module API
    module DailyFantasy
      include Fantasydata::API::Utils

      # Gets daily fantasy player information for given day.
      #
      # @see https://developer.fantasydata.com/docs/services/556a892e35491a1d30c7a8ba/operations/556a892f35491a02d05ebf42
      # @authentication Requires api key
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Fantasydata::BoxScore]
      # @param season [String] Year of the season and the season type. If no season type is provided, then the default is regular season Examples: 2015REG, 2015PRE, 2015POST, 2015
      # @example daily_fantasy_for_day
      #   Fantasydata.daily_fantasy_for_day('2014-SEP-21')
      def daily_fantasy_players_for_day(day)
        day = convert_to_date(day)
        objects_from_response(Fantasydata::DailyFantasyPlayer, :get, "/nfl/v2/JSON/DailyFantasyPlayers/#{day}")
      end

      # Get daily fantasy points for a given day.
      #
      # @see https://developer.fantasydata.com/docs/services/556a892e35491a1d30c7a8ba/operations/556a892f35491a02d05ebf42
      # @authentication Requires api key
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Fantasydata::BoxScore]
      # @param season [String] Year of the season and the season type. If no season type is provided, then the default is regular season Examples: 2015REG, 2015PRE, 2015POST, 2015
      # @example daily_fantasy_for_day
      #   Fantasydata.daily_fantasy_for_day('2014-SEP-21')
      def daily_fantasy_points_for_day(day)
        day = convert_to_date(day)
        objects_from_response(Fantasydata::DailyFantasyPoints, :get, "/nfl/v2/JSON/DailyFantasyPoints/#{day}")
      end

      def daily_fantasy_defense_game_stats year, week
        objects_from_response(Fantasydata::DailyFantasyPlayerStats, :get, "/nfl/v2/JSON/FantasyDefenseByGame/#{year}/#{week}")
      end

      def daily_fantasy_defense_game_projected_stats year, week
        objects_from_response(Fantasydata::DailyFantasyPlayerStats, :get, "/nfl/v2/JSON/FantasyDefenseProjectionsByGame/#{year}/#{week}")
      end

      def daily_fantasy_defense_season_stats year
        objects_from_response(Fantasydata::DailyFantasyPlayerStats, :get, "/nfl/v2/JSON/FantasyDefenseBySeason/#{year}")
      end

      def daily_fantasy_defense_season_projected_stats year
        objects_from_response(Fantasydata::DailyFantasyPlayerStats, :get, "/nfl/v2/JSON/FantasyDefenseProjectionsBySeason/#{year}")
      end

      private

        def convert_to_date input
          if input.is_a?(DateTime)
            input = input.strftime("%Y-%b-%d").upcase
          end
          input
        end
    end
  end
end
