# frozen_string_literal: true

require 'bundler/setup'
require 'omdb/api'
require 'webmock/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

WebMock.disable_net_connect!

def a_delete(path)
  a_request(:delete, Omdb::Api::Request::BASE_URI + path)
end

def a_get(path)
  a_request(:get, Omdb::Api::Request::BASE_URI + path)
end

def a_post(path)
  a_request(:post, Omdb::Api::Request::BASE_URI + path)
end

def a_put(path)
  a_request(:put, Omdb::Api::Request::BASE_URI + path)
end

def stub_delete(path)
  stub_request(:delete, Omdb::Api::Request::BASE_URI + path)
end

def stub_get(path)
  stub_request(:get, Omdb::Api::Request::BASE_URI + path)
end

def stub_post(path)
  stub_request(:post, Omdb::Api::Request::BASE_URI + path)
end

def stub_put(path)
  stub_request(:put, Omdb::Api::Request::BASE_URI + path)
end

def fixture_path
  File.expand_path('fixtures', __dir__)
end

def fixture(file)
  File.open(fixture_path + '/' + file)
end
