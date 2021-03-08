# frozen_string_literal: true

module Omdb
  module Api
    module PublicApi
      module Search
        def search(value, **options)
          perform_get(
            klass: Models::Movies,
            query_params: { search: value }.merge(options),
            headers: options.fetch(:headers, {})
          )
        end
      end
    end
  end
end
