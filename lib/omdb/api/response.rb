module Omdb
  module Api
    class Response

      def initialize(response)
        @response = JSON.parse(response)
      end

      def results
        @response.fetch("Search")
      rescue KeyError
        @response.fetch("Find")
      end

      def collection
        Omdb::Api::Collection.new(movies)
      end

      def movies
        [].tap do |movies|
          results.each do |movie|
            movies << Omdb::Api::Movie.new(movie)
          end
        end
      end
    end
  end
end
