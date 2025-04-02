# frozen_string_literal: true

module SleeperFF
  class Client
    module Users
      # Get a user by username
      #
      # @param username [String] Username of the Sleeper user
      # @return [Sawyer::Resource] User information
      def user(username)
        get "user/#{username}"
      end
    end
  end
end 