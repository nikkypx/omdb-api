module Omdb
  module Api
    class Request
      BASE_URI = 'https://www.omdbapi.com'.freeze

      attr_reader :api_key, :field, :value, :options

      def initialize(api_key, method, value, options)
        @api_key = api_key
        @field   = if /id/.match?(method)
                     'i'
                   elsif /title/.match?(method)
                     't'
                   else
                     's'
                   end
        @value   = CGI.escape(value)
        @options = options
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
