# frozen_string_literal: true

module Omdb
  module Api
    class Movie
      attr_reader :actors
      :awards
      :country
      :director
      :genre
      :imdb_id
      :imdb_rating
      :imdb_votes
      :language
      :metascore
      :plot
      :poster
      :rated
      :released
      :runtime
      :title
      :type
      :writer
      :year
      :error

      def initialize(params)
        params.each_pair do |k, v|
          instance_variable_set("@#{k}", v)
        end
      end
    end
  end
end
