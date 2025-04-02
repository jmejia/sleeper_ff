# frozen_string_literal: true

module SleeperFF
  # Custom error class for rescuing from all SleeperFF errors
  class Error < StandardError; end

  # Raised when Sleeper returns a 400 HTTP status code
  class BadRequest < Error; end

  # Raised when Sleeper returns a 401 HTTP status code
  class Unauthorized < Error; end

  # Raised when Sleeper returns a 403 HTTP status code
  class Forbidden < Error; end

  # Raised when Sleeper returns a 404 HTTP status code
  class NotFound < Error; end

  # Raised when Sleeper returns a 429 HTTP status code
  class TooManyRequests < Error; end

  # Raised when Sleeper returns a 500 HTTP status code
  class InternalServerError < Error; end

  # Raised when Sleeper returns a 502 HTTP status code
  class BadGateway < Error; end

  # Raised when Sleeper returns a 503 HTTP status code
  class ServiceUnavailable < Error; end
end 