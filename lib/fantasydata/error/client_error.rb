require 'fantasydata/error'

module Fantasydata
  class Error
    # Raised when Fantasydata returns a 4xx HTTP status code or there's an error in Faraday
    class ClientError < Fantasydata::Error

      # Create a new error from an HTTP environment
      #
      # @param response [Hash]
      # @return [Echowrap::Error]
      def self.from_response(response={})
        new(parse_error(response[:body]), response[:response_headers])
      end

    private

      def self.parse_error(body)
        body[:statusCode]
      end

    end
  end
end