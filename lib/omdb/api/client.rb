module Omdb
  module Api
    class Client

      def initialize(options)
      end

      def search(query, params = {})
        search_params = { s: query }.merge!(params)
        Omdb::Api::Connection.call(search_params)
      end

      # def find_by(params = {})
      #   options[
      #   Omdb::Api::Connection.call({t: movie})
      # end
      # alias_method :find, :find_by

    end
  end
end
