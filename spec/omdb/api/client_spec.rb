# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Omdb::Api::Client do
  let(:api_key) { 'api_key' }

  describe '#new' do
    it 'sets the api_key when the hash contains api_key' do
      client = Omdb::Api::Client.new(api_key: api_key)

      expect(client.api_key).to eq(api_key)
    end

    it 'can set configuration with a block' do
      client = Omdb::Api::Client.new do |c|
        c.api_key = api_key
      end

      expect(client.api_key).to eq(api_key)
    end
  end
end
