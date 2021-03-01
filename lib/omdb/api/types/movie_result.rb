# frozen_string_literal: true

module Omdb
  module Api
    module Types
      include Dry.Types()

      class MovieResult < Base
        attribute? :imdb_id, Omdb::Api::Types::String
        attribute? :poster,  Omdb::Api::Types::String
        attribute? :title,   Omdb::Api::Types::String
        attribute? :type,    Omdb::Api::Types::String
        attribute? :year,    Omdb::Api::Types::String
      end
    end
  end
end
