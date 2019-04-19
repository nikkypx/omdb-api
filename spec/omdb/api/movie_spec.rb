# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Omdb::Api::Movie do
  MOVIE_ATTRIBUTES = %w[
    actors
    awards
    country
    director
    genre
    imdbid
    imdbrating
    imdbvotes
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
    error
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
      # expect(response.awards).to eq 'Won 6 Oscars. Another 50 wins & 28 nominations.'
      # expect(response.boxOffice).to eq 'N/A'
      # expect(response.country).to eq 'USA'
      # expect(response.dvd).to eq '21 Sep 2004'
      # expect(response.director).to eq 'George Lucas'
      # expect(response.genre).to eq 'Action, Adventure, Fantasy'
      # expect(response.language).to eq 'English'
      # expect(response.metascore).to eq '90'
      # expect(response.plot).to eq "Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire's world-destroying battle station, while also attempting to rescue Princess Leia from the evil Darth Vader."
    end
  end
end
