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
