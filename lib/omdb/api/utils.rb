# frozen_string_literal: true

require 'active_support/all'

module Omdb
  module Api
    module Utils
      def perform_get(options)
        perform_request(:get, options)
      end

      def perform_request(request_method, options)
        klass = options.delete(:klass)

        response_handler(klass) do
          Omdb::Api::Request.new(self, request_method, options).perform
        end
      end

      def response_handler(klass)
        handle_response(yield, klass)
        # rescue Errno::ECONNREFUSED => e
      end

      def handle_response(resp, klass)
        resp.deep_transform_keys! { |k| k.underscore.to_sym }

        resp.fetch(:response) == 'True' ? klass.new(resp) : Models::Error.new(resp)
      end
    end
  end
end
