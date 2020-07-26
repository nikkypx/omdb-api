# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Omdb::Api::PublicApi do
  let(:api_key) { Faker::Lorem.word }
  let(:client) { Omdb::Api::Client.new(api_key: api_key) }

  describe '#find_by_title' do
    describe 'success' do
      before do
        stub_get("?apikey=#{api_key}&t=star%2Bwars")
          .to_return(
            body: fixture('find_by_title.json'),
            headers: { content_type: 'application/json; charset=utf-8' }
          )
      end

      it 'requests the correct resource' do
        client.find_by_title('star wars')
        expect(a_get("?apikey=#{api_key}&t=star%2Bwars")).to have_been_made
      end

      it 'returns an Omdb::Api::Movie object' do
        expect(client.find_by_title('star wars')).to be_a(Omdb::Api::Movie)
      end
    end

    describe 'error' do
      before do
        stub_get("?apikey=#{api_key}&t=badtitle")
          .to_return(
            body: fixture('incorrect_title.json'),
            headers: { content_type: 'application/json; charset=utf-8' }
          )
      end

      it 'returns an Omdb::Api::Error object when the title is not found' do
        expect(client.find_by_title('badtitle')).to be_a(Omdb::Api::Error)
      end
    end
  end

  describe 'multiple options' do
    before do
      stub_get("?apikey=#{api_key}&t=star%2Bwars&plot=short&r=xml")
        .to_return(
          body: fixture('find_with_options.json'),
          headers: { content_type: 'application/xml; charset=utf-8' }
        )
    end

    it 'requests the correct resource' do
      client.find_by_title('star wars', plot: 'short', r: 'xml')
      expect(a_get("?apikey=#{api_key}&plot=short&r=xml&t=star%2Bwars")).to have_been_made
    end
  end

  describe '#find_by_id' do
    describe 'success' do
      before do
        stub_get("?apikey=#{api_key}&i=tt0083929")
          .to_return(
            body: fixture('find_by_id.json'),
            headers: { content_type: 'application/json; charset=utf-8' }
          )
      end

      it 'requests the correct resource' do
        client.find_by_id('tt0083929')
        expect(a_get("?apikey=#{api_key}&i=tt0083929")).to have_been_made
      end

      it 'returns an Omdb::Api::Movie object' do
        expect(client.find_by_id('tt0083929')).to be_a(Omdb::Api::Movie)
      end
    end

    describe 'error' do
      before do
        stub_get("?apikey=#{api_key}&i=badid")
          .to_return(
            body: fixture('incorrect_id.json'),
            headers: { content_type: 'application/json; charset=utf-8' }
          )
      end

      it 'returns an Omdb::Api::Error object when the title is not found' do
        response = client.find_by_id('badid')
        expect(response).to be_a(Omdb::Api::Error)
        expect(response.response).to eq('False')
        expect(response.error).to eq('Incorrect IMDb ID.')
      end
    end
  end

  describe '#search' do
    describe 'success' do
      before do
        stub_get("?apikey=#{api_key}&s=indiana%2Bjones")
          .to_return(
            body: fixture('search.json'),
            headers: { content_type: 'application/json; charset=utf-8' }
          )
      end

      it 'requests the correct resource' do
        client.search('indiana jones')
        expect(a_get("?apikey=#{api_key}&s=indiana%2Bjones")).to have_been_made
      end

      it 'returns an Omdb::Api::Collection object' do
        expect(client.search('indiana jones')).to be_a(Omdb::Api::Collection)
      end

      it 'collection has movies' do
        expect(client.search('indiana jones').movies).to be_a(Array)
      end
    end

    describe 'error' do
      before do
        stub_get("?apikey=#{api_key}&s=nosearchresults")
          .to_return(
            body: fixture('no_search_results.json'),
            headers: { content_type: 'application/json; charset=utf-8' }
          )
      end

      it 'returns an Omdb::Api::Error object when the title is not found' do
        expect(client.search('nosearchresults')).to be_a(Omdb::Api::Error)
      end
    end
  end
end
