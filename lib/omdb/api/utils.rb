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

        res = Omdb::Api::Request.new(self, request_method, options).perform
        response_handler(res, klass)
      end

      def response_handler(res, klass)
        res.deep_transform_keys! { |k| k.underscore.to_sym }

        if res.fetch(:response) == 'True'
          klass.new(res)
        else
          Models::Error.new(res)
        end
      end
    end
  end
end
