module Omdb
  module Api
    class Connection
      BASE_URI = 'https://www.omdbapi.com'.freeze

      attr_accessor :attr, :m
      attr_writer :params

      def self.call(m, attr, params)
        new(m, attr, params).response
      end

      def initialize(m, attr, params)
        self.m      = m
        self.attr   = attr
        self.params = params
      end

      def params
        case m
        when :find_by_title
          { t: attr }
        when :find_by_id
          { i: attr }
        when :find_by
          attr.key?(:title) ? { t: attr[:title] } : { i: attr[:id] }
        when :search
          { s: attr }
        end
      end

      def request
        RestClient.get(BASE_URI, params: params)
      end

      def response
        Omdb::Api::Response.new(request).data
      end
    end
  end
end
