module Omdb
  module Api
    class Collection
      include Enumerable

      def initialize(movies)
        @movies = Array.new(movies)
      end

      def each
        movies.each { |item| yield item }
      end

      private

      attr_reader :movies
    end
  end
end
