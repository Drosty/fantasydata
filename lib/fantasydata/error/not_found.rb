require 'fantasydata/error/client_error'

module Fantasydata
  class Error
    # Raised when Fantasydata returns the HTTP status code 404
    class NotFound < Fantasydata::Error::ClientError
      HTTP_STATUS_CODE = 404
    end
  end
end