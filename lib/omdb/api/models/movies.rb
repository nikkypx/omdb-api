# frozen_string_literal: true

module Omdb
  module Api
    module Models
      class Movies < Dry::Struct
        attribute :search,
                  Shared::Types::Strict::Array
                    .of(Omdb::Api::Models::MovieResult)
                    .optional.default([].freeze)
      end
    end
  end
end
