# frozen_string_literal: true

module Omdb
  module Api
    module Models
      class Movie < Dry::Struct
        attribute :actors,       Shared::Types::String.optional
        attribute :awards,       Shared::Types::String.optional
        attribute :box_office,   Shared::Types::String.optional
        attribute :country,      Shared::Types::String.optional
        attribute :director,     Shared::Types::String.optional
        attribute :dvd,          Shared::Types::String.optional
        attribute? :error,       Shared::Types::String.optional
        attribute :genre,        Shared::Types::String.optional
        attribute :imdb_id,      Shared::Types::String.optional
        attribute :imdb_rating,  Shared::Types::String.optional
        attribute :imdb_votes,   Shared::Types::String.optional
        attribute :language,     Shared::Types::String.optional
        attribute :metascore,    Shared::Types::String.optional
        attribute :plot,         Shared::Types::String.optional
        attribute :poster,       Shared::Types::String.optional
        attribute :rated,        Shared::Types::String.optional
        attribute :released,     Shared::Types::String.optional
        attribute :runtime,      Shared::Types::String.optional
        attribute :title,        Shared::Types::String.optional
        attribute :type,         Shared::Types::String.optional
        attribute :writer,       Shared::Types::String.optional
        attribute :year,         Shared::Types::String.optional
      end
    end
  end
end
