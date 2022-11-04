# frozen_string_literal: true

require 'httparty'

module Omdb
  module Api
    class Request
      def initialize client, method, params
        @configuration = client.configuration
        @method = method
        @headers = headers params.delete(:headers)
        @params = params params.delete(:query_params)
      end

      def perform
        HTTParty.public_send @method, BASE_URI, headers: @headers, query: @params
      end

      private

      def params args
        args.symbolize_keys!

        {}.tap do |p|
          args.each { |k, v| p[PARAMS_MAP[k]] = v }
        end.merge({ apikey: @configuration.api_key })
      end

      def headers args
        headers_map = { content_type: 'Content-Type' }

        args.reduce({ 'Content-Type' => 'application/json' }) do |o, (k, v)|
          o[headers_map[k]] = v
        end
      end

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
    end
  end
end
