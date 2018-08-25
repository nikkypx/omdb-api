# frozen_string_literal: true

module Omdb
  module Api
    class Error
      ERROR_ATTRIBUTES = %i[
        response
        error
      ].freeze

      attr_reader(*ERROR_ATTRIBUTES)

      def initialize(response)
        attrs(response)
      end

      def attrs(response)
        response.each_key do |key|
          instance_variable_set("@#{key.downcase}".to_sym, response[key])
        end
      end
    end
  end
end
