module Omdb
  module Api
    class Movie
      MOVIE_ATTRIBUTES = %i[
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
        error
      ].freeze

      attr_reader(*MOVIE_ATTRIBUTES)

      def initialize(response)
        attrs(response)
      end

      def attrs(response)
        response.each_key do |key|
          instance_variable_set("@#{key.downcase}".to_sym, response[key])
        end
      end
    end
  end
end
