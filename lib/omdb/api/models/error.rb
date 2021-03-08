# frozen_string_literal: true

module Omdb
  module Api
    module Models
      class Error < Dry::Struct
        attribute :response, Shared::Types::String.optional
        attribute :error,    Shared::Types::String.optional
      end
    end
  end
end
