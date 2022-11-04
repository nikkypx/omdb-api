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

## 3.0 (2022-11-04)

* error object no longer contains response key
* `dry-struct` no longer dependency 
* `Omdb::Api::Models::Movies` object is now named `Omdb::Api::Models::Collection` 
* `Omdb::Api::Models::MovieResult` object is now named `Omdb::Api::Result` 
* `Omdb::Api::Models::Movie` now includes more attributes
