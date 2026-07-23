## 4.0 (2026-07-23)

### Breaking Changes

* `api_key` is required when creating a client
* configuration is validated and frozen after initialization
* unknown configuration options and query parameters raise `ArgumentError`
* non-success HTTP responses raise `Omdb::Api::Error`
* configuration supports `base_uri`, `headers`, and `timeout` in addition to `api_key`

### Fixes

* request options no longer mutate caller-owned hashes or HTTP responses
* `headers:` is kept out of the OMDb query string
* positional lookup arguments are not overridden by keyword options
* unknown OMDb response fields are ignored when building models
* query parameter mapping includes `type`, `page`, and `callback`

## 3.0 (2022-11-04)

* error object no longer contains response key
* `dry-struct` no longer dependency
* `Omdb::Api::Models::Movies` object is now named `Omdb::Api::Models::Collection`
* `Omdb::Api::Models::MovieResult` object is now named `Omdb::Api::Result`
* `Omdb::Api::Models::Movie` now includes more attributes

## 2.0 (2020-07-26)

### Breaking Changes

* query params given to the client will be full words
and mapped to the Omdb API params - implemented so far:

```ruby
{
  id: 'i',
  title: 't',
  search: 's',
  plot: 'plot',
  year: 'y',
  version: 'v'
}
```

* a collection is now called `Movies` and will return `MovieResult` objects
