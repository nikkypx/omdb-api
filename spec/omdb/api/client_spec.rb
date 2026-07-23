# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Omdb::Api::Client do
  let(:api_key) { 'api_key' }

  describe '#new' do
    describe 'configuration' do
      it 'can set configuration with a hash' do
        client = Omdb::Api::Client.new(api_key: api_key)

        expect(client.configuration.api_key).to eq(api_key)
      end

      it 'can set configuration with a block' do
        client = Omdb::Api::Client.new do |c|
          c.api_key = api_key
        end

        expect(client.configuration.api_key).to eq(api_key)
      end

      it 'rejects missing API keys' do
        expect { Omdb::Api::Client.new }.to raise_error(ArgumentError, 'api_key must be provided')
      end

      it 'rejects unknown configuration options' do
        expect do
          Omdb::Api::Client.new(api_key: api_key, retries: 3)
        end.to raise_error(ArgumentError, 'unknown configuration option: retries')
      end

      it 'creates an immutable configuration with defensive copies' do
        key = String.new(api_key)
        header_value = String.new('application/json')
        client = Omdb::Api::Client.new(api_key: key, headers: { 'Accept' => header_value })

        key.replace('changed')
        header_value.replace('changed')

        expect(client.configuration).to be_frozen
        expect(client.configuration.api_key).to eq(api_key)
        expect(client.configuration.headers).to eq('Accept' => 'application/json')
        expect(client.configuration.headers).to be_frozen
        expect(client.configuration.headers['Accept']).to be_frozen
      end

      it 'supports request settings' do
        client = Omdb::Api::Client.new(
          api_key: api_key,
          base_uri: 'https://example.test',
          timeout: 5
        )

        expect(client.configuration.base_uri).to eq('https://example.test')
        expect(client.configuration.timeout).to eq(5)
      end
    end
  end
end
