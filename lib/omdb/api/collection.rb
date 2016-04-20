module Omdb
  module Api
    class Collection < Array
      attr_reader :movies
      def initialize(response); super(response) end
    end
  end
end
