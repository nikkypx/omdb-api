# frozen_string_literal: true

module Omdb
  module Api
    class Request
      BASE_URI = 'https://www.omdbapi.com'.freeze

      attr_reader :api_key, :field, :value, :options

      def initialize(client, method, value, options)
        @api_key = client.api_key
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

      def query_params
        { query: { apikey: api_key, field.to_s => value.to_s }.merge(options) }
      end

      def response
        @response ||= HTTParty.get(BASE_URI, query_params)
      end

      def success?
        (response['Response'] || response['root']['response']) == 'True'
      end
    end
  end
end
