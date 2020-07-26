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
    end
  end
end
