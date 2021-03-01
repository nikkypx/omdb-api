# frozen_string_literal: true

module Omdb
  module Api
    module Types
      include Dry.Types()

      class Movie < Base
        attribute? :actors,      Omdb::Api::Types::String
        attribute? :awards,      Omdb::Api::Types::String
        attribute? :box_office,  Omdb::Api::Types::String
        attribute? :country,     Omdb::Api::Types::String
        attribute? :director,    Omdb::Api::Types::String
        attribute? :dvd,         Omdb::Api::Types::String
        attribute? :error,       Omdb::Api::Types::String
        attribute? :genre,       Omdb::Api::Types::String
        attribute? :imdb_id,     Omdb::Api::Types::String
        attribute? :imdb_rating, Omdb::Api::Types::String
        attribute? :imdb_votes,  Omdb::Api::Types::String
        attribute? :language,    Omdb::Api::Types::String
        attribute? :metascore,   Omdb::Api::Types::String
        attribute? :plot,        Omdb::Api::Types::String
        attribute? :poster,      Omdb::Api::Types::String
        attribute? :rated,       Omdb::Api::Types::String
        attribute? :released,    Omdb::Api::Types::String
        attribute? :runtime,     Omdb::Api::Types::String
        attribute? :title,       Omdb::Api::Types::String
        attribute? :type,        Omdb::Api::Types::String
        attribute? :writer,      Omdb::Api::Types::String
        attribute? :year,        Omdb::Api::Types::String
      end
    end
  end
end
