# frozen_string_literal: true

require 'klass_param'

module Omdb
  module Api
    class Error
      include KlassParam

      param :response
      param :error
    end
  end
end
