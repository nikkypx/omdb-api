# frozen_string_literal: true

require 'omdb/api/request'
require 'omdb/api/models'

module Omdb
  module Api
    module PublicApi
      %i[find_by_id find_by_title].each do |method|
        define_method method do |arg, **opts|
          key = method.to_s.split('_').last.to_sym
          perform_get(
            query_params: query_options(opts).merge(key => arg),
            klass: Models::Movie,
            headers: opts.fetch(:headers, {})
          )
        end
      end

      def search(term, **opts)
        perform_get(
          query_params: query_options(opts).merge(search: term),
          klass: Models::Collection,
          headers: opts.fetch(:headers, {})
        )
      end

      private

      def query_options(options)
        options.reject { |key, _| key == :headers }
      end
    end
  end
end
