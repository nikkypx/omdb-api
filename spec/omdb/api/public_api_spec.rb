# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Omdb::Api::PublicApi do
  let(:api_key) { Faker::Lorem.word }
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
        expect(response.response).to eq('False')
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

      it 'returns an Omdb::Api::Models::Movies object' do
        expect(client.search('indiana jones')).to be_a(Omdb::Api::Models::Movies)
      end

      it 'collection has MovieResult objects' do
        expect(client.search('indiana jones').search).to be_a(Array)
        expect(client.search('indiana jones').search.first).to be_a(Omdb::Api::Models::MovieResult)
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
end
