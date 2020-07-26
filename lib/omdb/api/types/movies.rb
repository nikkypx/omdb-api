# frozen_string_literal: true

module Omdb
  module Api
    module Types
      include Dry.Types()

      class Movies < Base
        attribute :search, Omdb::Api::Types::Strict::Array.of(Omdb::Api::Types::MovieResult).optional.default([])
      end
    end
  end
end
