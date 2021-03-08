# frozen_string_literal: true

module Omdb
  module Api
    module PublicApi
      module FindBy
        def find_by_id(id, **options)
          perform_get(
            klass: Models::Movie,
            query_params: { id: id }.merge(options),
            headers: options.fetch(:headers, {})
          )
        end

        def find_by_title(title, **options)
          perform_get(
            klass: Models::Movie,
            query_params: { title: title }.merge(options),
            headers: options.fetch(:headers, {})
          )
        end
      end
    end
  end
end
