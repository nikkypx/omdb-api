module Omdb
  module Api
    class Movie

      MOVIE_ATTRIBUTES = %i(
        actors
        awards
        country
        director
        genre
        imdbid
        imdbrating
        imdbvotes
        language
        metascore
        plot
        poster
        rated
        released
        runtime
        title
        writer
        year
        error)

      attr_reader *MOVIE_ATTRIBUTES

      def initialize(movie)
        @movie = movie
        attrs
      end

      def attrs
        [].tap do |attributes|
          @movie.keys.each do |key|
            attributes << instance_variable_set("@#{key.downcase}".to_sym, @movie[key])
          end
        end
      end
    end
  end
end
