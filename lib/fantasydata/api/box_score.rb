require 'fantasydata/api/utils'

module Fantasydata
  module API
    module BoxScore
      include Fantasydata::API::Utils

      # This method returns individual box scores for a given season, week and home team.
      #
      # @see https://developer.fantasydata.com/docs/services/556a892e35491a1d30c7a8ba/operations/556a892f35491a02d05ebf40
      # @authentication Requires api key
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Fantasydata::BoxScore]
      # @param season [String] Year of the season and the season type. If no season type is provided, then the default is regular season Examples: 2015REG, 2015PRE, 2015POST, 2015
      # @param week [Integer] Week of the season. Valid values are as follows: Preseason 0 to 4, Regular Season 1 to 17, Postseason 1 to 4
      # @param hometeam [String] Abbreviation of the home team. Example: WAS
      # @example box_score_by_team
      #   Fantasydata.box_score_by_team('2015REG', 15, 'MIN')
      def box_score_by_team(season, week, home_team)
        object_from_response(Fantasydata::BoxScore, :get, "/nfl/v2/JSON/BoxScore/#{season}/#{week}/#{home_team}")
      end


      # This method returns all box scores for a given season and week.
      #
      # @see https://developer.fantasydata.com/docs/services/556a892e35491a1d30c7a8ba/operations/556a892f35491a02d05ebf41
      # @authentication Requires api key
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array<Fantasydata::BoxScore>]
      # @param season [String] Year of the season and the season type. If no season type is provided, then the default is regular season Examples: 2015REG, 2015PRE, 2015POST, 2015
      # @param week [Integer] Week of the season. Valid values are as follows: Preseason 0 to 4, Regular Season 1 to 17, Postseason 1 to 4
      # @example box_scores_by_week
      #   Fantasydata.box_scores_by_week('2015REG', 15)
      def box_scores_by_week(season, week)
        objects_from_response(Fantasydata::BoxScore, :get, "/nfl/v2/JSON/BoxScores/#{season}/#{week}")
      end

      # This method returns box scores for all games that are either in-progress or have been updated within the last 30 minutes.
      #
      # @see https://developer.fantasydata.com/docs/services/556a892e35491a1d30c7a8ba/operations/556a892f35491a02d05ebf3e
      # @authentication Requires api key
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array<Fantasydata::BoxScore>]
      # @example box_scores_active
      #   Fantasydata.box_scores_active
      def box_scores_active
        objects_from_response(Fantasydata::BoxScore, :get, "/nfl/v2/JSON/ActiveBoxScores")
      end

      # This method returns all box scores for a given season and week, but only returns player stats that have changed in the last X minutes.
      #
      # @see https://developer.fantasydata.com/docs/services/556a892e35491a1d30c7a8ba/operations/556a892f35491a02d05ebf3e
      # @authentication Requires api key
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array<Fantasydata::BoxScore>]
      # @param season [String] Year of the season and the season type. If no season type is provided, then the default is regular season Examples: 2015REG, 2015PRE, 2015POST, 2015
      # @param week [Integer] Week of the season. Valid values are as follows: Preseason 0 to 4, Regular Season 1 to 17, Postseason 1 to 4
      # @param minutes [Integer] Only returns player statistics that have changed in the last X minutes. You specify how many minutes in time to go back. Valid entries are: 1 or 2 (etc.)
      # @example box_scores_delta
      #   Fantasydata.box_scores_delta('2014REG', 1, 5)
      def box_scores_delta(season, week, minutes)
        objects_from_response(Fantasydata::BoxScore, :get, "/nfl/v2/JSON/BoxScoresDelta/#{season}/#{week}/#{minutes}")
      end

      # This method returns all box scores for the current week, but only returns player stats that have changed in the last X minutes.
      #
      # @see https://developer.fantasydata.com/docs/services/556a892e35491a1d30c7a8ba/operations/556a892f35491a02d05ebf3e
      # @authentication Requires api key
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array<Fantasydata::BoxScore>]
      # @param minutes [Integer] Only returns player statistics that have changed in the last X minutes. You specify how many minutes in time to go back. Valid entries are: 1 or 2 (etc.)
      # @example box_scores_delta_current_week
      #   Fantasydata.box_scores_delta_current_week(5)
      def box_scores_delta_current_week(minutes)

      end

      #
      #
      # @see https://developer.fantasydata.com/docs/services/556a892e35491a1d30c7a8ba/operations/556a892f35491a02d05ebf4b
      # @authentication Requires api key
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array<Fantasydata::BoxScore>]
      # @example box_scores_final
      #   Fantasydata.box_scores_final
      def box_scores_final
      end

      #
      #
      # @see https://developer.fantasydata.com/docs/services/556a892e35491a1d30c7a8ba/operations/556a892f35491a02d05ebf55
      # @authentication Requires api key
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Fantasydata::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array<Fantasydata::BoxScore>]
      # @example box_scores_live
      #   Fantasydata.box_scores_live
      def box_scores_live
      end

    end
  end
end
