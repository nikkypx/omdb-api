require 'omdb/api/version'
require 'omdb/api/collection'
require 'omdb/api/connection'
require 'omdb/api/movie'
require 'omdb/api/client'
require 'omdb/api/response'

module Omdb
  module Api
    def self.client
      Omdb::Api::Client.new
    end

    def self.method_missing(method, *args, &block)
      return super unless client.respond_to?(method)
      client.send(method, *args, &block)
    end

    def self.respond_to_missing?(method, include_private = false)
      method =~ /search|find/ || super
    end
  end
end
