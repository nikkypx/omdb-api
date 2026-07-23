# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Omdb::Api::PublicApi do
  let(:api_key) { 'foobar' }
  let(:client) { Omdb::Api::Client.new(api_key: api_key) }

  describe '#find_by_title' do
    context 'when success' do
      before do
        stub_get("?apikey=#{api_key}&t=star%20wars")
          .to_return(
            body: fixture('find_by_title.json'),
            headers: { content_type: 'application/json' }
          )
      end

      it 'requests the correct resource' do
        client.find_by_title('star wars')
        expect(a_get("?apikey=#{api_key}&t=star%20wars")).to have_been_made.times(1)
      end

      it 'returns an Omdb::Api::Movie object' do
        movie = client.find_by_title('star wars')

        expect(movie.actors).to eq 'Mark Hamill, Harrison Ford, Carrie Fisher, Peter Cushing'
        expect(movie.awards).to eq 'Won 6 Oscars. Another 50 wins & 28 nominations.'
        expect(movie.box_office).to eq 'N/A'
        expect(movie.country).to eq 'USA'
        expect(movie.director).to eq 'George Lucas'
        expect(movie.dvd).to eq '21 Sep 2004'
        expect(movie.error).to eq nil
        expect(movie.genre).to eq 'Action, Adventure, Fantasy'
        expect(movie.imdb_id).to eq 'tt0076759'
        expect(movie.imdb_rating).to eq '8.6'
        expect(movie.imdb_votes).to eq '1,068,163'
        expect(movie.language).to eq 'English'
        expect(movie.metascore).to eq '90'
        expect(movie.plot).to eq "Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire's world-destroying battle station, while also attempting to rescue Princess Leia from the evil Darth Vader."
        expect(movie.poster).to eq 'https://m.media-amazon.com/images/M/MV5BNzVlY2MwMjktM2E4OS00Y2Y3LWE3ZjctYzhkZGM3YzA1ZWM2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'
        expect(movie.rated).to eq 'PG'
        expect(movie.released).to eq '25 May 1977'
        expect(movie.runtime).to eq '121 min'
        expect(movie.title).to eq 'Star Wars: Episode IV - A New Hope'
        expect(movie.type).to eq 'movie'
        expect(movie.writer).to eq 'George Lucas'
        expect(movie.year).to eq '1977'
      end
    end

    context 'when error' do
      before do
        stub_get("?apikey=#{api_key}&t=badtitle")
          .to_return(
            body: fixture('incorrect_title.json'),
            headers: { content_type: 'application/json; charset=utf-8' }
          )
      end

      it 'returns an Omdb::Api::Error object when the title is not found' do
        expect(client.find_by_title('badtitle')).to be_a(Omdb::Api::Models::Error)
      end
    end
  end

  describe 'multiple options' do
    before do
      stub_get("?apikey=#{api_key}&t=star%20wars&plot=short")
        .to_return(
          body: fixture('find_by_title.json'),
          headers: { content_type: 'application/json; charset=utf-8' }
        )
    end

    it 'requests the correct resource' do
      client.find_by_title('star wars', plot: 'short')
      expect(a_get("?apikey=#{api_key}&plot=short&t=star%20wars")).to have_been_made
    end

    it 'keeps headers out of the query string without mutating options' do
      options = { plot: 'short', headers: { 'X-Request-ID' => 'request-1' } }

      client.find_by_title('star wars', **options)

      expect(
        a_get("?apikey=#{api_key}&plot=short&t=star%20wars")
          .with(headers: { 'X-Request-ID' => 'request-1' })
      ).to have_been_made
      expect(options).to eq(plot: 'short', headers: { 'X-Request-ID' => 'request-1' })
    end

    it 'rejects unknown query options' do
      expect do
        client.find_by_title('star wars', unknown: 'value')
      end.to raise_error(ArgumentError, 'unknown query parameter: unknown')
    end

    it 'keeps the positional argument when an overlapping option is provided' do
      stub_get("?apikey=#{api_key}&t=star%20wars")
        .to_return(
          body: fixture('find_by_title.json'),
          headers: { content_type: 'application/json' }
        )

      client.find_by_title('star wars', title: 'ignored')

      expect(a_get("?apikey=#{api_key}&t=star%20wars")).to have_been_made
    end
  end

  describe 'unexpected response shapes' do
    it 'ignores unknown fields from series responses' do
      stub_get("?apikey=#{api_key}&t=game%20of%20thrones")
        .to_return(
          body: fixture('find_by_series.json'),
          headers: { content_type: 'application/json' }
        )

      series = client.find_by_title('game of thrones')

      expect(series).to be_a(Omdb::Api::Models::Movie)
      expect(series.title).to eq('Game of Thrones')
      expect(series.type).to eq('series')
    end

    it 'raises when the HTTP request fails' do
      stub_get("?apikey=#{api_key}&t=star%20wars")
        .to_return(status: 500, body: 'server error')

      expect do
        client.find_by_title('star wars')
      end.to raise_error(Omdb::Api::Error, 'OMDb request failed with status 500')
    end
  end

  describe '#find_by_id' do
    context 'when success' do
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
        expect(client.find_by_id('tt0083929')).to be_a(Omdb::Api::Models::Movie)
      end
    end

    context 'when error' do
      before do
        stub_get("?apikey=#{api_key}&i=badid")
          .to_return(
            body: fixture('incorrect_id.json'),
            headers: { content_type: 'application/json; charset=utf-8' }
          )
      end

      it 'returns an Omdb::Api::Error object when the title is not found' do
        response = client.find_by_id('badid')
        expect(response).to be_a(Omdb::Api::Models::Error)
        expect(response.error).to eq('Incorrect IMDb ID.')
      end
    end
  end

  describe '#search' do
    context 'when success' do
      before do
        stub_get("?apikey=#{api_key}&s=indiana%20jones")
          .to_return(
            body: fixture('search.json'),
            headers: { content_type: 'application/json; charset=utf-8' }
          )
      end

      it 'requests the correct resource' do
        client.search('indiana jones')
        expect(a_get("?apikey=#{api_key}&s=indiana%20jones")).to have_been_made
      end

      it 'returns an Omdb::Api::Models::Collection object' do
        expect(client.search('indiana jones')).to be_a(Omdb::Api::Models::Collection)
      end

      it 'collection has Result objects' do
        expect(client.search('indiana jones').search).to be_a(Array)
        expect(client.search('indiana jones').search.first).to be_a(Omdb::Api::Models::Result)
      end
    end

    context 'when error' do
      before do
        stub_get("?apikey=#{api_key}&s=nosearchresults")
          .to_return(
            body: fixture('no_search_results.json'),
            headers: { content_type: 'application/json; charset=utf-8' }
          )
      end

      it 'returns an Omdb::Api::Error object when the title is not found' do
        expect(client.search('nosearchresults')).to be_a(Omdb::Api::Models::Error)
      end
    end
  end

  describe 'thread safety' do
    it 'supports concurrent requests from one client' do
      titles = Array.new(10) { |index| "movie #{index}" }
      titles.each do |title|
        stub_request(:get, Omdb::Api::Request::BASE_URI)
          .with(query: { apikey: api_key, t: title })
          .to_return(
            body: fixture('find_by_title.json'),
            headers: { content_type: 'application/json' }
          )
      end

      threads = titles.map do |title|
        Thread.new { client.find_by_title(title) }
      end

      expect(threads.map(&:value)).to all(be_a(Omdb::Api::Models::Movie))
      titles.each do |title|
        expect(
          a_request(:get, Omdb::Api::Request::BASE_URI)
            .with(query: { apikey: api_key, t: title })
        ).to have_been_made.once
      end
    end
  end
end
