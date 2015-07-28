require 'fantasydata/error/client_error'

module Fantasydata
  class Error
    # Raised when Fantasydata returns the HTTP status code 429
    class TooManyRequests < Fantasydata::Error::ClientError
      HTTP_STATUS_CODE = 429
    end
    EnhanceYourCalm = TooManyRequests
    RateLimited = TooManyRequests
  end
end
