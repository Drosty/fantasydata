require 'faraday'
require 'multi_json'
require 'fantasydata/configurable'
require 'fantasydata/api/game'
require 'fantasydata/api/box_score'

module Fantasydata
  class Client
    include Fantasydata::API::Game
    include Fantasydata::Configurable

    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return [Fantasydata::Client]
    def initialize(options={})
      Fantasydata::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Fantasydata.instance_variable_get(:"@#{key}"))
      end
    end

    # Perform an HTTP GET request
    def get(path, params={})
      request(:get, path, params)
    end

    # Perform an HTTP POST request
    # def post(path, params={})
    #  signature_params = params.values.any?{|value| value.respond_to?(:to_io)} ? {} : params
    #  request(:post, path, params, signature_params)
    #end

    private

      def request(method, path, params={}, signature_params=params)
        connection.headers['Ocp-Apim-Subscription-Key'] = @api_key
        connection.send(method.to_sym, path, params).env
      rescue Faraday::Error::ClientError
        raise Fantasydata::Error::ClientError
      rescue MultiJson::DecodeError
        raise Fantasydata::Error::DecodeError
      end

      # Returns a Faraday::Connection object
      #
      # @return [Faraday::Connection]
      def connection
        @connection ||= begin
          connection_options = {:builder => @middleware}
          connection_options[:ssl] = {:verify => true} if @endpoint[0..4] == 'https'
          Faraday.new(@endpoint, @connection_options.merge(connection_options))
        end
      end

  end
end