# frozen_string_literal: true

module Omdb
  module Api
    class Request
      BASE_URI = 'https://www.omdbapi.com'

      attr_reader :client, :field, :value, :options

      def self.call(client, method, value, options, &block)
        new(client, method, value, options).make_get_to_imdb_api(&block)
      end

      def initialize(client, method, value, options)
        @client  = client
        @value   = CGI.escape(value)
        @options = options
        @field   = if /id/.match?(method)
                     'i'
                   elsif /title/.match?(method)
                     't'
                   else
                     's'
                   end
      end

      def make_get_to_imdb_api
        params = {
          query: {
            apikey: client.api_key,
            field.to_s => value.to_s
          }.merge(options)
        }

        yield HTTParty.get(BASE_URI, params)
      end
    end
  end
end
