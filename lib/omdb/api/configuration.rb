# frozen_string_literal: true

module Omdb
  module Api
    class Configuration
      DEFAULT_BASE_URI = 'https://www.omdbapi.com'
      DEFAULT_TIMEOUT = 10
      OPTIONS = %i[api_key base_uri headers timeout].freeze

      attr_reader(*OPTIONS)

      def self.build(options = {})
        builder = Builder.new(options)
        yield builder if block_given?
        builder.build
      end

      def initialize(api_key:, base_uri: DEFAULT_BASE_URI, headers: {}, timeout: DEFAULT_TIMEOUT)
        raise ArgumentError, 'api_key must be provided' if api_key.nil? || api_key.to_s.empty?
        raise ArgumentError, 'base_uri must be provided' if base_uri.nil? || base_uri.to_s.empty?
        raise ArgumentError, 'headers must be a Hash' unless headers.is_a?(Hash)
        raise ArgumentError, 'timeout must be a number greater than zero' unless timeout.is_a?(Numeric) && timeout.positive?

        @api_key = immutable_copy(api_key.to_s)
        @base_uri = immutable_copy(base_uri.to_s)
        @headers = immutable_headers(headers)
        @timeout = timeout
        freeze
      end

      private

      def immutable_headers(headers)
        headers.each_with_object({}) do |(key, value), copy|
          copy[immutable_copy(key)] = immutable_copy(value)
        end.freeze
      end

      def immutable_copy(value)
        case value
        when Hash
          value.each_with_object({}) do |(key, item), copy|
            copy[immutable_copy(key)] = immutable_copy(item)
          end.freeze
        when Array
          value.map { |item| immutable_copy(item) }.freeze
        else
          value.dup.freeze
        end
      rescue TypeError
        value.freeze
      end

      class Builder
        attr_accessor(*OPTIONS)

        def initialize(options)
          raise ArgumentError, 'configuration must be a Hash' unless options.is_a?(Hash)

          @base_uri = DEFAULT_BASE_URI
          @headers = {}
          @timeout = DEFAULT_TIMEOUT

          options.each do |key, value|
            name = key.respond_to?(:to_sym) ? key.to_sym : key
            raise ArgumentError, "unknown configuration option: #{key}" unless OPTIONS.include?(name)

            public_send("#{name}=", value)
          end
        end

        def build
          Configuration.new(
            api_key: api_key,
            base_uri: base_uri,
            headers: headers,
            timeout: timeout
          )
        end
      end

      private_constant :Builder
    end
  end
end
