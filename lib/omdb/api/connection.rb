require 'rest-client'

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
        RestClient.get(BASE_URI, params: params)
      end

      def response
        Omdb::Api::Response.new(request).data
      end
    end
  end
end
