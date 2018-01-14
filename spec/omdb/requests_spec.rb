require 'spec_helper'

RSpec.describe Omdb::Api do
  describe 'finding' do
    it '#find_by_title' do
      VCR.use_cassette('find_by_title') do
        expect(Omdb::Api.find_by_title('Indiana Jones')).to be_a(
          Omdb::Api::Movie
        )
      end
    end

    it '#find_by with title arg' do
      VCR.use_cassette('find_by_with_title_arg') do
        expect(Omdb::Api.find_by(title: 'Indiana Jones')).to be_a(
          Omdb::Api::Movie
        )
      end
    end

    it '#find_by_id' do
      VCR.use_cassette('find_by_id') do
        expect(Omdb::Api.find_by_id('tt0083929')).to be_a(Omdb::Api::Movie)
      end
    end

    it '#find_by with id arg' do
      VCR.use_cassette('find_by_with_id_arg') do
        expect(Omdb::Api.find_by(id: 'tt0083929')).to be_a(Omdb::Api::Movie)
      end
    end
  end

  describe '#search' do
    it 'returns a collection object' do
      VCR.use_cassette('search_indiana_jones') do
        expect(Omdb::Api.search('indiana jones')).to be_a(
          Omdb::Api::Collection
        )
      end
    end

    it 'the collection is made up of movie objects' do
      VCR.use_cassette('search_kill_bill') do
        expect(Omdb::Api.search('kill bill').first).to be_a(Omdb::Api::Movie)
      end
    end
  end

  describe '#movie' do
    it 'has attributes set' do
      VCR.use_cassette('search_indiana_jones') do
        movie = Omdb::Api.search('indiana jones').first
        expect(movie).to respond_to(:imdbid, :poster, :title, :type, :year)
      end
    end
  end
end
