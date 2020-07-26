# frozen_string_literal: true

module Omdb
  module Api
    module Types
      include Dry.Types()

      class Movie < Base
        attribute :actors,      Omdb::Api::Types::String.optional.default(nil)
        attribute :awards,      Omdb::Api::Types::String.optional.default(nil)
        attribute :box_office,  Omdb::Api::Types::String.optional.default(nil)
        attribute :country,     Omdb::Api::Types::String.optional.default(nil)
        attribute :director,    Omdb::Api::Types::String.optional.default(nil)
        attribute :dvd,         Omdb::Api::Types::String.optional.default(nil)
        attribute :error,       Omdb::Api::Types::String.optional.default(nil)
        attribute :genre,       Omdb::Api::Types::String.optional.default(nil)
        attribute :imdb_id,     Omdb::Api::Types::String.optional.default(nil)
        attribute :imdb_rating, Omdb::Api::Types::String.optional.default(nil)
        attribute :imdb_votes,  Omdb::Api::Types::String.optional.default(nil)
        attribute :language,    Omdb::Api::Types::String.optional.default(nil)
        attribute :metascore,   Omdb::Api::Types::String.optional.default(nil)
        attribute :plot,        Omdb::Api::Types::String.optional.default(nil)
        attribute :poster,      Omdb::Api::Types::String.optional.default(nil)
        attribute :rated,       Omdb::Api::Types::String.optional.default(nil)
        attribute :released,    Omdb::Api::Types::String.optional.default(nil)
        attribute :runtime,     Omdb::Api::Types::String.optional.default(nil)
        attribute :title,       Omdb::Api::Types::String.optional.default(nil)
        attribute :type,        Omdb::Api::Types::String.optional.default(nil)
        attribute :writer,      Omdb::Api::Types::String.optional.default(nil)
        attribute :year,        Omdb::Api::Types::String.optional.default(nil)
      end
    end
  end
end
