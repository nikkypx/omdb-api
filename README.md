# Omdb Api

[![Build Status](https://travis-ci.org/nikkypx/omdb-api.svg?branch=master)](https://travis-ci.org/nikkypx/omdb-api)

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

A `#search` will return a collection of `Omdb::Api::Movie` objects and
`find_by` will return a single `Omdb::Api::Movie` object. You can use
`#find_by_id` and `#find_by_title` in addition to `find_by`. See below:


```ruby
require 'omdb/api'

Omdb::Api.find_by_title('star wars')
=> #<Omdb::Api::Movie:0x007f9a7d453cf0 @actors="Harrison Ford"...

Omdb::Api.find_by(title: 'fight club')
=> #<Omdb::Api::Movie:0x007ffec3089188 @title="Fight Club"...

Omdb::Api.find_by(id: 'tt0083929')
=> #<Omdb::Api::Movie:0x007f960a648f28
 @actors="Sean Penn, Jennifer Jason Leigh, Judge Reinhold, Robert Romanus",

Omdb::Api.search('indiana jones')
=> [#<Omdb::Api::Movie:0x007ffec28ad1a8 @title="Indiana...
```

An `Omdb::Api::Movie` object has

`#actors`
`#awards`
`#country`
`#director`
`#genre`
`#imdbid`
`#imdbrating`
`#imdbvotes`
`#language`
`#metascore`
`#plot`
`#poster`
`#rated`
`#released`
`#response`
`#runtime`
`#title`
`#type`
`#writer`
`#year`

## Development

`$ rake` to run the specs

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nikkypx/omdb-api.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
