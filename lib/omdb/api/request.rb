# frozen_string_literal: true

require 'httparty'

module Omdb
  module Api
    class Request
      def initialize(client, method, params)
        @configuration = client.configuration
        @method = method
        @headers = format_headers(params.delete(:headers))
        @params = format_params(params.delete(:query_params))
      end

      def perform
        HTTParty.public_send(@method, BASE_URI, headers: @headers, query: @params)
      end

      private

      BASE_URI = 'https://www.omdbapi.com'

      PARAMS_MAP = {
        id: 'i',
        title: 't',
        search: 's',
        plot: 'plot',
        year: 'y',
        return: 'r',
        version: 'v'
      }.freeze

      def format_params(params)
        params.symbolize_keys!

        {}.tap do |p|
          params.each { |k, v| p[PARAMS_MAP[k]] = v }
        end.merge({ apikey: @configuration.api_key })
      end

      def format_headers(headers)
        headers_map = { content_type: 'Content-Type' }

        headers.each_with_object({ 'Content-Type' => 'application/json' }) do |(k, v), o|
          o[headers_map[k]] = v
        end
      end
    end
  end
end
