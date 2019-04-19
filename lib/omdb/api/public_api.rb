# frozen_string_literal: true

module Omdb
  module Api
    module PublicApi
      %i[find_by_id find_by_title].each do |method|
        define_method(method) do |value, **options|
          request = Omdb::Api::Request.new(self, method, value, options)

          data = request.response
          movie = __format_data(data)

          if request.success?
            Omdb::Api::Movie.new(params: movie)
          else
            Omdb::Api::Error.new(params: movie)
          end
        end
      end

      def search(value, options = {})
        request = Omdb::Api::Request.new(self, 'search', value, options)

        if request.success?
          Omdb::Api::Collection.new(
            request.response.fetch('Search').map do |movie|
              movie = __format_data(movie)

              Omdb::Api::Movie.new(params: movie)
            end
          )
        else
          Omdb::Api::Error.new(params: request.response)
        end
      end

      def __format_data(data)
        keys = data.keys.map(&:underscore)
        keys.zip(data.values).to_h
      end
    end
  end
end
