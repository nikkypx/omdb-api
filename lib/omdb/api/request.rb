# frozen_string_literal: true

require 'httparty'

module Omdb
  module Api
    class Request
      BASE_URI = 'https://www.omdbapi.com'

      def initialize(client, request_method, params)
        @configuration = client.configuration
        @request_method = request_method
        @headers = s_headers(params.delete(:headers))
        @params = s_params(params.delete(:query_params))
      end

      def perform
        http_client.public_send(
          @request_method,
          BASE_URI,
          headers: @headers,
          query: @params
        )
      end

      private

      PARAMS_MAP = {
        id: 'i',
        title: 't',
        search: 's',
        plot: 'plot',
        year: 'y',
        return: 'r',
        version: 'v'
      }.freeze

      def s_params(params)
        {}.tap do |p|
          params.each { |k, v| p[PARAMS_MAP[k]] = v }
        end.merge({ apikey: @configuration.api_key })
      end

      def s_headers(headers)
        key_translate = {
          content_type: 'Content-Type'
        }

        translated_headers = headers.each_with_object({}) do |(k, v), o|
          o[key_translate[k]] = v
        end

        { 'Content-Type' => 'application/json' }.merge(translated_headers)
      end

      def http_client
        HTTParty
      end
    end
  end
end
