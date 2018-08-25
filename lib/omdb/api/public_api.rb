# frozen_string_literal: true

module Omdb
  module Api
    module PublicApi
      %i[find_by_id find_by_title search].each do |method|
        define_method(method) do |value, **options|
          request = Omdb::Api::Request.new(api_key, method, value, options)

          if method == :search && request.success?
            movies = [].tap do |m|
              request.response.fetch('Search').each do |movie|
                m << Omdb::Api::Movie.new(movie)
              end
            end
            Omdb::Api::Collection.new(movies)
          elsif request.success?
            Omdb::Api::Movie.new(request.response)
          else
            Omdb::Api::Error.new(request.response)
          end
        end
      end
    end
  end
end
