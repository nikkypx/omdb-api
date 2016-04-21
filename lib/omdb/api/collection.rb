module Omdb
  module Api
    class Collection < Array
      def initialize(movies)
        super(movies)
      end
    end
  end
end
