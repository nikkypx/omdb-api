# Omdb Api

> A Ruby interface to the [Open Movie Database API](http://omdbapi.com/)

## Required

You must request an API key first from [here](http://omdbapi.com/apikey.aspx)

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

```ruby
client = Omdb::Api::Client.new(api_key: [your API key])`
```

You can also set the API key with a block

```ruby
client = Omdb::Api::Client.new do |config|
  config.api_key = api_key
end
```

### Fetching

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

```ruby
client.find_by_title('star wars', plot: 'short')`
```

Returns an `Omdb::Api::Models::Movie`

An unsuccessful query will return an `Omdb::Api::Models::Error` object

## API

**Parent**<br />
Omdb::Api::Movie

**Methods**<br />
#actors<br />
#awards<br />
#box_office<br />
#country<br />
#director<br />
#dvd<br />
#error<br />
#genre<br />
#imdb_id<br />
#imdb_rating<br />
#imdb_votes<br />
#language<br />
#metascore<br />
#plot<br />
#poster<br />
#rated<br />
#released<br />
#runtime<br />
#title<br />
#type<br />
#writer<br />
#year<br />


**Parent**<br />
Omdb::Api::Error

**Methods**<br />
#response<br />
#error

## Development

To run the specs

```bash
  $ bundle exec rake
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nikkypx/omdb-api.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
