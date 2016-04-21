require 'rest_client'

module Omdb
  module Api
    class Connection
      BASE_URI = "https://www.omdbapi.com"

      attr_reader :params

      def self.call(params)
        new(params).response
      end

      def initialize(params)
        @params = params
      end

      def request
        begin
          RestClient.get(BASE_URI, params: params)
        rescue
        end
      end

      def response
        Omdb::Api::Response.new(request).collection
      end
    end
  end
end
