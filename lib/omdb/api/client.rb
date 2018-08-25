# frozen_string_literal: true

module Omdb
  module Api
    class Client
      include PublicApi

      attr_accessor :api_key

      def initialize(options = {})
        options.each_pair do |k, v|
          instance_variable_set("@#{k}", v)
        end
        yield(self) if block_given?
      end
    end
  end
end
