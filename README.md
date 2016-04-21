# Omdb::Api

A ruby interface for the [Open Movie Database API](http://omdbapi.com/)

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

A `#search` will return a collection of `Omdb::Api::Movie` objects and a `find` 
or `find_by` will return a single `Omdb::Api::Movie` object. It is
also possible to search by the IMDB id.


```ruby
Omdb::Api.find_by(title: 'fight club')
=> #<Omdb::Api::Movie:0x007ffec3089188 @title="Fight Club"...

Omdb::Api.find_by(id: 'tt0083929')

Omdb::Api.search('indiana jones')
=> [#<Omdb::Api::Movie:0x007ffec28ad1a8 @title="Indiana...

```


## Development

`$ rake` to run the specs

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nikkypx/omdb-api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
