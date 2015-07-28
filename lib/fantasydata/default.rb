require 'faraday'
require 'faraday/request/multipart'
require 'fantasydata/configurable'
require 'fantasydata/error/client_error'
require 'fantasydata/error/server_error'
require 'fantasydata/response/parse_json'
require 'fantasydata/response/raise_error'
require 'fantasydata/version'

module Fantasydata
  module Default
    ENDPOINT = 'http://api.nfldata.apiphany.com' unless defined? Fantasydata::Default::ENDPOINT
    CONNECTION_OPTIONS = {
      :headers => {
        :accept => 'application/json',
        :user_agent => "FantasyData Ruby Gem #{Fantasydata::VERSION}",
      },
      :request => {
        :open_timeout => 5,
        :timeout => 10,
        :params_encoder => Faraday::FlatParamsEncoder
      },
      :ssl => {
        :verify => false
      },
    } unless defined? Fantasydata::Default::CONNECTION_OPTIONS
    IDENTITY_MAP = false unless defined? Fantasydata::Default::IDENTITY_MAP
    MIDDLEWARE = Faraday::RackBuilder.new do |builder|
      # Convert file uploads to Faraday::UploadIO objects
      # builder.use Fantasydata::Request::MultipartWithFile
      
      # Checks for files in the payload
      builder.use Faraday::Request::Multipart
      
      # Convert request params to "www-form-urlencoded"
      builder.use Faraday::Request::UrlEncoded
      
      # Handle 4xx server responses
      builder.use Fantasydata::Response::RaiseError, Fantasydata::Error::ClientError
      
      # Parse JSON response bodies using MultiJson
      builder.use Fantasydata::Response::ParseJson
      
      # Handle 5xx server responses
      builder.use Fantasydata::Response::RaiseError, Fantasydata::Error::ServerError
      
      builder.use Faraday::Response::Logger

      # Set Faraday's HTTP adapter
      builder.adapter Faraday.default_adapter
    end unless defined? Fantasydata::Default::MIDDLEWARE

    class << self

      # @return [Hash]
      def options
        Hash[Fantasydata::Configurable.keys.map{|key| [key, send(key)]}]
      end

      # @return [String]
      def api_key
        ENV['FANTASYDATA_API_KEY']
      end

      # @note This is configurable in case you want to use a Fantasydata-compatible endpoint.
      # @return [String]
      def endpoint
        ENDPOINT
      end

      def connection_options
        CONNECTION_OPTIONS
      end

      # @note Faraday's middleware stack implementation is comparable to that of Rack middleware.  The order of middleware is important: the first middleware on the list wraps all others, while the last middleware is the innermost one.
      # @see https://github.com/technoweenie/faraday#advanced-middleware-usage
      # @see http://mislav.uniqpath.com/2011/07/faraday-advanced-http/
      # @return [Faraday::RackBuilder]
      def middleware
        MIDDLEWARE
      end

    end
  end
end