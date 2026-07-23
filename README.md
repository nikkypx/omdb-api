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

# Or configure with a block. Configuration is validated and made immutable
# when the client is created, so one client can safely be shared by threads.
client = Omdb::Api::Client.new do |config|
  config.api_key = api_key
  config.timeout = 5
  config.headers = { 'User-Agent' => 'my-app' }
end

client.find_by_title('star wars')
# => #<struct Omdb::Api::Models::Movie actors="Harrison Ford", ...>

client.find_by_id('tt0083929')
# => #<struct Omdb::Api::Models::Movie actors="Sean Penn, ...", ...>

client.search('indiana jones')
# => #<struct Omdb::Api::Models::Collection search=[#<struct Omdb::Api::Models::Result ...>]>
```

Supported configuration options are `api_key`, `base_uri`, `headers`, and
`timeout`. The API key is required. Per-request headers can be supplied with
`headers:`, and search options include `year`, `type`, `plot`, and `page`.

## Installation

```ruby
gem 'omdb-api', '~> 4.0'
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
