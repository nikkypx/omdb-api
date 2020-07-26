# frozen_string_literal: true

module Omdb
  module Api
    module Types
      class Base < Dry::Struct
        transform_keys(&:to_sym)
      end
    end
  end
end
