# frozen_string_literal: true

require 'active_support/core_ext/hash'
require 'omdb/api/error'

module Omdb
  module Api
    module Utils
      def perform_get(options)
        perform_request :get, options
      end

      def perform_request(request_method, options)
        klass = options.fetch(:klass)

        res = Omdb::Api::Request.new(configuration, request_method, options).perform
        raise_http_error!(res) unless res.success?

        response_handler(res) do |pr|
          if pr.delete(:response) == 'True'
            if klass == Omdb::Api::Models::Movie
              build_model(klass, pr)
            elsif klass == Omdb::Api::Models::Collection
              build_model(klass, pr).tap do |col|
                col.search = Array(col.search).map { |result| build_model(Models::Result, result) }
              end
            end
          else
            build_model(Models::Error, pr)
          end
        end
      end

      def response_handler(res)
        parsed_response = res.parsed_response
        raise Omdb::Api::Error, "unexpected OMDb response: #{parsed_response.class}" unless parsed_response.is_a?(Hash)

        yield parsed_response.deep_transform_keys { |key| key.to_s.underscore.to_sym }
      end

      def build_model(klass, attributes)
        members = klass.members
        values = attributes.each_with_object({}) do |(key, value), result|
          result[key] = value if members.include?(key)
        end

        klass.new(**values)
      end

      def raise_http_error!(response)
        raise Omdb::Api::Error, "OMDb request failed with status #{response.code}"
      end
    end
  end
end
