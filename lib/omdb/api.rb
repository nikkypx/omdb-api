require "omdb/api/version"
require "omdb/api/collection"
require "omdb/api/movie"

module Omdb
  module Api
    class << self
      %w(find find_by_title find_all_by_title).each do |m|
        define_method("#{m}") do |arg|
          case m
          when "find"
            Omdb::Api.new(arg, "i").run
          when "find_by_title"
            Omdb::Api.new(arg, "t").run
          else
            Omdb::Api.new(arg, "s").run
          end
        end
      end
    end
  end
end
