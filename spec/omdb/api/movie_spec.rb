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
  end
end
