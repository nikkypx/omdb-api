# frozen_string_literal: true

require 'omdb/api/request'
require 'omdb/api/models'
require 'omdb/api/public_api/find_by'
require 'omdb/api/public_api/search'

module Omdb
  module Api
    module PublicApi
      include FindBy
      include Search
    end
  end
end
