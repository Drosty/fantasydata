require 'fantasydata/error/server_error'

module Fantasydata
  class Error
    # Raised when Fantasydata returns the HTTP status code 504
    class GatewayTimeout < Fantasydata::Error::ServerError
      HTTP_STATUS_CODE = 504
      MESSAGE = "The Fantasydata servers are up, but the request couldn't be serviced due to some failure within our stack. Try again later."
    end
  end
end