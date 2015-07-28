require 'fantasydata/error/server_error'

module Fantasydata
  class Error
    # Raised when Echowrap returns the HTTP status code 502
    class BadGateway < Fantasydata::Error::ServerError
      HTTP_STATUS_CODE = 502
      MESSAGE = "Fantasydata is down or being upgraded."
    end
  end
end