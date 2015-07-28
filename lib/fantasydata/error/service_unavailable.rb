require 'fantasydata/error/server_error'

module Fantasydata
  class Error
    # Raised when Fantasydata returns the HTTP status code 503
    class ServiceUnavailable < Fantasydata::Error::ServerError
      HTTP_STATUS_CODE = 503
      MESSAGE = "Fantasydata is over capacity."
    end
  end
end