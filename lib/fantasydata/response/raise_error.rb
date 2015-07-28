require 'faraday'
require 'fantasydata/error/bad_gateway'
require 'fantasydata/error/bad_request'
require 'fantasydata/error/forbidden'
require 'fantasydata/error/gateway_timeout'
require 'fantasydata/error/internal_server_error'
require 'fantasydata/error/not_acceptable'
require 'fantasydata/error/not_found'
require 'fantasydata/error/service_unavailable'
require 'fantasydata/error/too_many_requests'
require 'fantasydata/error/unauthorized'
require 'fantasydata/error/unprocessable_entity'

module Fantasydata
  module Response
    class RaiseError < Faraday::Response::Middleware

      def on_complete(env)
        status_code = env[:status].to_i
        error_class = @klass.errors[status_code]
        raise error_class.from_response(env) if error_class
      end

      def initialize(app, klass)
        
        @klass = klass
        super(app)
      end

    end
  end
end