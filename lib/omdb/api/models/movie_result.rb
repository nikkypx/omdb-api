# frozen_string_literal: true

module Omdb
  module Api
    module Models
      class MovieResult < Dry::Struct
        attribute :imdb_id, Shared::Types::String.optional
        attribute :poster,  Shared::Types::String.optional
        attribute :title,   Shared::Types::String.optional
        attribute :type,    Shared::Types::String.optional
        attribute :year,    Shared::Types::String.optional
      end
    end
  end
end
