require 'fantasydata/error/client_error'

module Fantasydata
  class Error
    # Raised when Fantasydata returns the HTTP status code 406
    class NotAcceptable < Fantasydata::Error::ClientError
      HTTP_STATUS_CODE = 406
    end
  end
end