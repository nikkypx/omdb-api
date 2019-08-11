# frozen_string_literal: true

module Omdb
  module Api
    class Error
      attr_reader :response,
                  :error

      def initialize(params)
        params.each_pair do |k, v|
          instance_variable_set("@#{k}", v)
        end
      end
    end
  end
end
