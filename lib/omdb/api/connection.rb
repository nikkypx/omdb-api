require 'rest-client'

module Omdb
  module Api
    class Connection
      BASE_URI = 'https://www.omdbapi.com'.freeze

      attr_accessor :params

      def self.call(params)
        new(params).response
      end

      def initialize(params)
        self.params = params
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
