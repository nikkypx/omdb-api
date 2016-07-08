require 'json'

module Omdb
  module Api
    class Response
      def initialize(response)
        @response = JSON.parse(response)
      end

      def data
        @response.key?('Search') ? collection : Omdb::Api::Movie.new(@response)
      end

      def movies
        [].tap do |movies|
          @response.fetch('Search').each do |movie|
            movies << Omdb::Api::Movie.new(movie)
          end
        end
      end

      def collection
        Omdb::Api::Collection.new(movies)
      end
    end
  end
end
