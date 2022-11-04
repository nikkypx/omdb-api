# frozen_string_literal: true

require 'omdb/api/request'
require 'omdb/api/models'

module Omdb
  module Api
    module PublicApi
      %i[find_by_id find_by_title].each do |method|
        define_method method do |arg, **opts|
          key = method.to_s.split('_').last
          perform_get(
            query_params: { key => arg }.merge(opts),
            klass: Models::Movie,
            headers: opts.fetch(:headers, {})
          )
        end
      end

      def search term, **opts
        perform_get(
          query_params: { search: term }.merge(opts),
          klass: Models::Collection,
          headers: opts.fetch(:headers, {})
        )
      end
    end
  end
end
