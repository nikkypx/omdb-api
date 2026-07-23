# frozen_string_literal: true

require 'omdb/api/utils'
require 'omdb/api/public_api'
require 'omdb/api/configuration'

module Omdb
  module Api
    class Client
      include Utils
      include PublicApi

      attr_reader :configuration

      def initialize(options = {}, &block)
        @configuration = Configuration.build(options, &block)
      end
    end
  end
end
