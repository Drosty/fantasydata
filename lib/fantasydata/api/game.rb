require 'fantasydata/api/utils'

module Fantasydata
  module API
    module Game
      include Fantasydata::API::Utils

      # Get a list of artist biographies.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#biographies
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array<Echowrap::Biography>]
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'ARH6W4X1187B99274F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @option options [Integer] :results The desired number of results to return, the valid range is 0 to 100, with 15 as the default
      # @option options [Integer] :start The desired index of the first result returned, must be on of [0, 15, 30] with 0 as the default
      # @option options [String] :license The desired license of the returned images. Not required, can send multiple, must be one of ['echo-source', 'all-rights-reserved', 'cc-by-sa', 'cc-by-nc', 'cc-by-nc-nd', 'cc-by-nc-sa', 'cc-by-nd', 'cc-by', 'public-domain', 'unknown'].
      # @example Biographies via id
      #   Echowrap.artist_biographies(:id => 'ARH6W4X1187B99274F')
      def games_in_progress(options={})
        boolean_from_response(:get, '/nfl/v2/JSON/AreAnyGamesInProgress', options)
      end

    end
  end
end