require 'fantasydata/error/server_error'

module Fantasydata
  class Error
    # Raised when Fantasydata returns the HTTP status code 500
    class InternalServerError < Fantasydata::Error::ServerError
      HTTP_STATUS_CODE = 500
      MESSAGE = "Something is technically wrong."
    end
  end
end