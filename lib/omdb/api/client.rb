module Omdb
  module Api
    module Client
      class << self
        %i[find_by find_by_id find_by_title search].each do |m|
          define_method(m) do |key, **params|
            Omdb::Api::Connection.call(m, key, params)
          end
        end
      end
    end
  end
end
