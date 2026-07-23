# frozen_string_literal: true

require 'httparty'
require 'omdb/api/configuration'

module Omdb
  module Api
    class Request
      def initialize(configuration, method, params)
        @configuration = configuration
        @method = method
        @headers = headers(params.fetch(:headers, {}))
        @params = query_params(params.fetch(:query_params, {}))
      end

      def perform
        HTTParty.public_send(
          @method,
          @configuration.base_uri,
          headers: @headers,
          query: @params,
          timeout: @configuration.timeout
        )
      end

      private

      def query_params(args)
        raise ArgumentError, 'query parameters must be a Hash' unless args.is_a?(Hash)

        args.each_with_object({}) do |(key, value), result|
          name = key.respond_to?(:to_sym) ? key.to_sym : key
          mapped_name = PARAMS_MAP.fetch(name) do
            raise ArgumentError, "unknown query parameter: #{key}"
          end
          result[mapped_name] = value
        end.merge(apikey: @configuration.api_key)
      end

      def headers(args)
        raise ArgumentError, 'headers must be a Hash' unless args.is_a?(Hash)

        @configuration.headers.merge(args).each_with_object(default_headers) do |(key, value), result|
          name = key.respond_to?(:to_sym) ? key.to_sym : key
          result[HEADERS_MAP.fetch(name, key.to_s)] = value
        end
      end

      def default_headers
        { 'Content-Type' => 'application/json' }
      end

      BASE_URI = Configuration::DEFAULT_BASE_URI

      HEADERS_MAP = { content_type: 'Content-Type' }.freeze

      PARAMS_MAP = {
        callback: 'callback',
        id: 'i',
        page: 'page',
        plot: 'plot',
        return: 'r',
        search: 's',
        title: 't',
        type: 'type',
        version: 'v',
        year: 'y'
      }.freeze
    end
  end
end
