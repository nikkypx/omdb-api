require 'spec_helper'

RSpec.describe Omdb::Api do

  # describe '#find_by' do
  #   it 'returns a response a movie object' do
  #     VCR.use_cassette('find_a_movie') do
  #       expect(Omdb::Api.find_by(:title, "Indiana Jones")).to be_a(Omdb::Api::Movie)
  #     end
  #   end

  #   it 'can find a movie by the title' do
  #     VCR.use_cassette('find_a_movie') do
  #       expect(Omdb::Api.find_by(:title, "Indiana Jones")).to eq("")
  #     end
  #   end
  # end

  describe '#search' do
    it 'returns a collection object' do
      VCR.use_cassette('search_movies') do
        expect(Omdb::Api.search('indiana jones')).to be_a(Omdb::Api::Collection)
      end
    end

    it 'the collection is made up of movie objects' do
      VCR.use_cassette('search_movies') do
        expect(Omdb::Api.search('indiana jones').first).to be_a(Omdb::Api::Movie)
      end
    end
  end

  describe '#movie' do
    it 'has attributes set' do
      VCR.use_cassette('search_movies') do
        movie = Omdb::Api.search('indiana jones').first
        expect(movie).to respond_to(:imdbid, :poster, :title, :type, :year)
      end
    end
  end
end
