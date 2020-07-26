# frozen_string_literal: true

require 'omdb/api/request'
require 'omdb/api/utils'
require 'omdb/api/types'
require 'omdb/api/public_api/find_by'
require 'omdb/api/public_api/search'

module Omdb
  module Api
    module PublicApi
      include Utils
      include FindBy
      include Search
    end
  end
end
