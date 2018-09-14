# Omdb Api

[![Build Status](https://travis-ci.org/nikkypx/omdb-api.svg?branch=master)](https://travis-ci.org/nikkypx/omdb-api)

> A ruby interface for the [Open Movie Database API](http://omdbapi.com/)

## Required

You must request an API key first from [here](http://omdbapi.com/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omdb-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omdb-api

## Usage

### Configuration

First you have to create a client object with your API key

`client = Omdb::Api::Client.new(api_key: [your API key])`

You can also set the API key with a block

```ruby
client = Omdb::Api::Client.new do |config|
  config.api_key = api_key
end
```

### API

```ruby
require 'omdb/api'

client.find_by_title('star wars')
=> #<Omdb::Api::Movie:0x007f9a7d453cf0 @actors="Harrison Ford"...

client.find_by_id('tt0083929')
=> #<Omdb::Api::Movie:0x007f960a648f28 @actors="Sean Penn, Jennifer Jason Leigh, Judge Reinhold, Robert Romanus",

client.search('indiana jones')
=> [#<Omdb::Api::Movie:0x007ffec28ad1a8 @title="Indiana...
```

You can also pass options to these methods that match the available options from 
the OMDB API spec.

For example:

`client.find_by_title('star wars', plot: 'short')`

Returns an `Omdb::Api::Movie`

`#find_by_id('id')`

`#find_by_title('title')`

Returns an `Omdb::Api::Collection`

`#search('movie')`

An unsuccessful query will return an `Omdb::Api::Error` object


An `Omdb::Api::Movie` object has

```ruby
#actors
#awards
#country
#director
#genre
#imdbid
#imdbrating
#imdbvotes
#language
#metascore
#plot
#poster
#rated
#released
#response
#runtime
#title
#type
#writer
#year
```

An `Omdb::Api::Error` object has

```ruby
#response
#error
```

## Development

`$ rake` to run the specs

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nikkypx/omdb-api.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
