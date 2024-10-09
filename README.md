# Omdb Api

> Ruby interface to the Open Movie Database API.

## Features

- `#find_by_id`
- `#find_by_title`
- `#search`

## Usage

```ruby
require 'omdb/api'

client = Omdb::Api::Client.new(api_key: [your API key])

# Or configure with a block
client = Omdb::Api::Client.new do |config|
  config.api_key = api_key
end

client.find_by_title('star wars')
# => #<Omdb::Api::Movie:0x007f9a7d453cf0 @actors="Harrison Ford", ...>

client.find_by_id('tt0083929')
# => #<Omdb::Api::Movie:0x007f960a648f28 @actors="Sean Penn, Jennifer Jason Leigh, Judge Reinhold, Robert Romanus", ...>

client.search('indiana jones')
# => [#<Omdb::Api::Movie:0x007ffec28ad1a8 @title="Indiana Jones and the Last Crusade", ...>, ...]
```

## Installation

```ruby
gem 'omdb-api', '~> 1.0.0'
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
