# frozen_string_literal: true

require 'active_support/core_ext/hash'

module Omdb
  module Api
    module Utils
      def perform_get options
        perform_request :get, options
      end

      def perform_request request_method, options
        klass = options.delete(:klass)

        res = Omdb::Api::Request.new(self, request_method, options).perform

        response_handler(res) do |pr|
          if pr.delete(:response) == 'True'
            if klass == Omdb::Api::Models::Movie
              klass.new **pr
            elsif klass == Omdb::Api::Models::Collection
              klass.new(**pr).tap do |col|
                col.search = col.search.map { |r| Models::Result.new(**r) }
              end
            end
          else
            Models::Error.new **pr
          end
        end
      end

      def response_handler res
        res.deep_transform_keys! { |k| k.underscore.to_sym }

        yield res
      end
    end
  end
end
