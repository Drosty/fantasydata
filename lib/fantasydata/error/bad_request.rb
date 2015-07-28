require 'fantasydata/error/client_error'

module Fantasydata
  class Error
    # Raised when Echowrap returns the HTTP status code 400
    class BadRequest < Fantasydata::Error::ClientError
      HTTP_STATUS_CODE = 400
    end
  end
end