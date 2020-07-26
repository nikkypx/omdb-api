# frozen_string_literal: true

module Omdb
  module Api
    module Types
      include Dry.Types()

      class MovieResult < Base
        attribute :imdb_id, Omdb::Api::Types::String.optional.default(nil)
        attribute :poster,  Omdb::Api::Types::String.optional.default(nil)
        attribute :title,   Omdb::Api::Types::String.optional.default(nil)
        attribute :type,    Omdb::Api::Types::String.optional.default(nil)
        attribute :year,    Omdb::Api::Types::String.optional.default(nil)
      end
    end
  end
end
