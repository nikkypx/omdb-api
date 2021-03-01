# frozen_string_literal: true

module Omdb
  module Api
    module Types
      include Dry.Types()

      class Error < Base
        attribute? :response, Omdb::Api::Types::String
        attribute? :error,    Omdb::Api::Types::String
      end
    end
  end
end
