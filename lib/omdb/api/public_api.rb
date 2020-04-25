# frozen_string_literal: true

module Omdb
  module Api
    module PublicApi
      %i[find_by_id find_by_title].each do |method|
        define_method(method) do |value, **options|
          Omdb::Api::Request.call(self, method, value, options) do |response|
            response = format_response(response)
            if response.dig('response') == 'False'
              Omdb::Api::Error.new(response)
            else
              Omdb::Api::Movie.new(response)
            end
          end
        end
      end

      def search(value, options = {})
        Omdb::Api::Request.call(self, 'search', value, options) do |response|
          begin
            Omdb::Api::Collection.new(
              response.fetch('Search').map do |movie_data|
                response = format_response(movie_data)

                Omdb::Api::Movie.new(response)
              end
            )
          rescue StandardError
            Omdb::Api::Error.new(response)
          end
        end
      end

      private

      def format_response(response)
        response.keys.map(&:underscore).zip(response.values).to_h
      end
    end
  end
end
