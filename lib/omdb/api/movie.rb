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
        type
        writer
        year
        error)

      attr_reader *MOVIE_ATTRIBUTES

      def initialize(response)
        set_attrs(response)
      end

      def set_attrs(response)
        [].tap do |attributes|
          response.keys.each do |key|
            attributes << instance_variable_set("@#{key.downcase}".to_sym, response[key])
          end
        end
      end
    end
  end
end
