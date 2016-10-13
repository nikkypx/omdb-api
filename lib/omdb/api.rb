require 'omdb/api/version'
require 'omdb/api/collection'
require 'omdb/api/connection'
require 'omdb/api/movie'
require 'omdb/api/client'
require 'omdb/api/response'

module Omdb
  module Api
    class << self
      def client
        Omdb::Api::Client
      end

      def method_missing(method, *args, &block)
        return super unless client.respond_to?(method)
        client.send(method, *args)
      end

      def respond_to_missing?(method, *)
        method =~ /find(_by)?(_id|_title)?|search/ || super
      end
    end
  end
end
