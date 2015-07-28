require 'fantasydata/error/client_error'

module Fantasydata
  class Error
    # Raised when Fantasydata returns the HTTP status code 403
    class Forbidden < Fantasydata::Error::ClientError
      HTTP_STATUS_CODE = 403
    end
  end
end