# frozen_string_literal: true

require 'omdb/api/utils'
require 'omdb/api/public_api'

module Omdb
  module Api
    class Client
      include Utils
      include PublicApi

      attr_reader :configuration

      def initialize(options = {})
        @configuration = Configuration.new
        options.each { |k, v| @configuration.__send__("#{k}=", v) }
        yield(@configuration) if block_given?
      end

      class Configuration
        attr_accessor :api_key
      end

      private_constant :Configuration
    end
  end
end
