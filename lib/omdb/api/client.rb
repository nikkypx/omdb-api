module Omdb
  module Api
    class Client
      def initialize(options)
      end

      def search(query, params = {})
        Omdb::Api::Connection.call(movie_params('search', query, params = {}))
      end

      def find_by(params = {})
        Omdb::Api::Connection.call(movie_params('find', nil, params))
      end
      alias_method :find, :find_by

      def movie_params(type, query = nil, params = {})
        if type.eql?('find')
          params.key?(:title) ? { t: params[:title] } : { i: params[:id] }
        else
          { s: query }
        end.merge!(params.reject! { |k, _| k != 'plot' || k != 'tomatoes' } || {})
      end
    end
  end
end
