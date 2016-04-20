module Omdb
  module Api
    class Movie
      attr_reader :actors,     :awards,    :country,
        :director,   :genre,     :imdbid,
        :imdbrating, :imdbvotes, :language,
        :metascore,  :plot,      :poster,
        :rated,      :released,  :runtime,
        :title,      :writer,    :year,
        :error

      def initialize(movie)
        @movie = movie
        create_instance_variables
      end

      def create_instance_variables
        [].tap do |attributes|
          @movie.keys.each do |key|
            attributes << instance_variable_set("@#{key.downcase}".to_sym, @movie[key])
          end
        end
      end
    end
  end
end
