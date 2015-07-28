require 'fantasydata/error/client_error'

module Fantasydata
  class Error
    # Raised when Echowrap returns the HTTP status code 401
    class Unauthorized < Fantasydata::Error::ClientError
      HTTP_STATUS_CODE = 401
    end
  end
end