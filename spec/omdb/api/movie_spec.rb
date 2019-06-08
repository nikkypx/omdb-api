# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Omdb::Api::Movie do
  MOVIE_ATTRIBUTES = %w[
    actors
    awards
    box_office
    country
    director
    dvd
    error
    genre
    imdb_id
    imdb_rating
    imdb_votes
    language
    metascore
    plot
    poster
    rated
    released
    runtime
    title
    type
    writer
    year
  ].freeze

  let(:client) { Omdb::Api::Client.new(api_key: 'AK') }

  describe '#new' do
    before do
      stub_get('?apikey=AK&t=star%2Bwars').to_return(body: fixture('find_by_title.json'), headers: { content_type: 'application/json; charset=utf-8' })
    end

    it 'responds to correct attributes' do
      response = client.find_by_title('star wars')

      MOVIE_ATTRIBUTES.each do |attr|
        expect(response.respond_to?(attr))
      end
    end

    it 'correctly sets attributes' do
      response = client.find_by_title('star wars')
      expect(response.actors).to eq 'Mark Hamill, Harrison Ford, Carrie Fisher, Peter Cushing'
      expect(response.awards).to eq 'Won 6 Oscars. Another 50 wins & 28 nominations.'
      expect(response.box_office).to eq 'N/A'
      expect(response.country).to eq 'USA'
      expect(response.director).to eq 'George Lucas'
      expect(response.dvd).to eq '21 Sep 2004'
      expect(response.error).to eq nil
      expect(response.genre).to eq 'Action, Adventure, Fantasy'
      expect(response.imdb_id).to eq 'tt0076759'
      expect(response.imdb_rating).to eq '8.6'
      expect(response.imdb_votes).to eq '1,068,163'
      expect(response.language).to eq 'English'
      expect(response.metascore).to eq '90'
      expect(response.plot).to eq "Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire's world-destroying battle station, while also attempting to rescue Princess Leia from the evil Darth Vader."
      expect(response.poster).to eq 'https://m.media-amazon.com/images/M/MV5BNzVlY2MwMjktM2E4OS00Y2Y3LWE3ZjctYzhkZGM3YzA1ZWM2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'
      expect(response.rated).to eq 'PG'
      expect(response.released).to eq '25 May 1977'
      expect(response.runtime).to eq '121 min'
      expect(response.title).to eq 'Star Wars: Episode IV - A New Hope'
      expect(response.type).to eq 'movie'
      expect(response.writer).to eq 'George Lucas'
      expect(response.year).to eq '1977'
    end
  end
end
