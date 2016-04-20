require 'spec_helper'

describe Omdb::Api do
  before :each do
    @movie = OMDB.find_by_title('star wars')
  end

  it 'has a version number' do
    expect(Omdb::Api::VERSION).not_to be nil
  end

  it 'should be an instance of OMDB::Movie' do
    expect(@movie).to be_instance_of(OMDB::Movie)
  end

  it 'should respond to #title' do
    expect(@movie).to respond_to(:title)
  end

  it 'should respond to #actors' do
    expect(@movie).to respond_to(:actors)
  end

  it 'should respond to #awards' do
    expect(@movie).to respond_to(:awards)
  end

  it 'should respond to #country' do
    expect(@movie).to respond_to(:country)
  end

  it 'should respond to #director' do
    expect(@movie).to respond_to(:director)
  end

  it 'should respond to #genre' do
    expect(@movie).to respond_to(:genre)
  end

  it 'should respond to #imdbid' do
    expect(@movie).to respond_to(:imdbid)
  end

  it 'should respond to #imdbrating' do
    expect(@movie).to respond_to(:imdbrating)
  end

  it 'should respond to #imdbvotes' do
    expect(@movie).to respond_to(:imdbvotes)
  end

  it 'should respond to #language' do
    expect(@movie).to respond_to(:language)
  end

  it 'should respond to #metascore' do
    expect(@movie).to respond_to(:metascore)
  end

  it 'should respond to #plot' do
    expect(@movie).to respond_to(:plot)
  end

  it 'should respond to #poster' do
    expect(@movie).to respond_to(:poster)
  end

  it 'should respond to #rated' do
    expect(@movie).to respond_to(:rated)
  end

  it 'should respond to #released' do
    expect(@movie).to respond_to(:released)
  end

  it 'should respond to #runtime' do
    expect(@movie).to respond_to(:runtime)
  end

  it 'should respond to #writer' do
    expect(@movie).to respond_to(:writer)
  end

  it 'should respond to #year' do
    expect(@movie).to respond_to(:year)
  end

end
