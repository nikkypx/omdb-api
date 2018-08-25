# frozen_string_literal: true

module Omdb
  module Api
    class Collection
      include Enumerable
      attr_accessor :movies

      def initialize(movies)
        self.movies = Array.new(movies)
      end

      def each
        movies.each { |item| yield item }
      end
    end
  end
end
