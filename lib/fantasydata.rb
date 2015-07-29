require "fantasydata/version"
require 'fantasydata/client'
require 'fantasydata/configurable'
require 'fantasydata/bye_week'
require 'fantasydata/daily_fantasy_player'
require 'fantasydata/error'
require 'fantasydata/version'

module Fantasydata
  class << self
    include Fantasydata::Configurable

    # Delegate to a Echowrap::Client
    #
    # @return [Echowrap::Client]
    def client
      @client = Fantasydata::Client.new(options) unless defined?(@client) && @client.hash == options.hash
      @client
    end

    def respond_to_missing?(method_name, include_private=false); client.respond_to?(method_name, include_private); end if RUBY_VERSION >= "1.9"
    def respond_to?(method_name, include_private=false); client.respond_to?(method_name, include_private) || super; end if RUBY_VERSION < "1.9"

    private

      def method_missing(method_name, *args, &block)
        return super unless client.respond_to?(method_name)
        client.send(method_name, *args, &block)
      end
  end
end

Fantasydata.setup
