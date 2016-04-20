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

OMDB.find takes an IMDB id and will return an OMDB::Movie object

    $ OMDB.find('tt1392190')
    => #<OMDB::Movie:0x007fe8eeeaf860
     @actors="Tom Hardy, Charlize Theron, Nicholas Hoult, Rosie Huntington-Whiteley",
     @awards="N/A",
    

OMDB.find_by_title takes a title and will return the first occurence

    $ OMDB.find_by_title('star wars')
    => #<OMDB::Movie:0x007fe43bf53968>


OMDB.find_all_by_title takes a title and will return a collection of OMDB::Movie objects:

    $ OMDB.find_all_by_title('star wars')
    => => [#<OMDB::Movie:0x007ff1335ea610
     @actors="Mark Hamill, Harrison Ford, Carrie Fisher, Peter Cushing",
     @awards="Won 6 Oscars. Another 38 wins & 26 nominations.",

An OMDB::Movie object has a number of attributes you can call on it, for example.
    
    $ movie = OMDB.find_by_title('fight club')
    $ movie.rated 
    => "R"
    
    $ OMDB.find_by_title('star wars').title
    => "Star Wars"
    
    $ OMDB.find_by_title('star wars').year
    => "1983"
    
    $ OMDB.find_all_by_title('star').first.title
    => "Star Wars: Episode IV - A New Hope"

A complete list of OMDB::Movie attributes
    
    OMDB::Movie#title    
    OMDB::Movie#actors
    OMDB::Movie#awards
    OMDB::Movie#country
    OMDB::Movie#director
    OMDB::Movie#genre
    OMDB::Movie#imdbid
    OMDB::Movie#imdbrating
    OMDB::Movie#imdbvotes
    OMDB::Movie#language
    OMDB::Movie#metascore
    OMDB::Movie#plot
    OMDB::Movie#poster
    OMDB::Movie#rated
    OMDB::Movie#released
    OMDB::Movie#runtime
    OMDB::Movie#writer
    OMDB::Movie#year


## Development

`$ rake` to run the specs

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/omdb-api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
