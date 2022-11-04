# frozen_string_literal: true

module Omdb
  module Api
    module Models
      Movie = Struct.new(
        *%i[
        actors
        awards
        box_office
        country
        director
        dvd
        error
        genre
        imdb_id
        imdb_rating
        imdb_votes
        language
        metascore
        plot
        poster
        rated
        ratings
        production
        released
        website
        runtime
        title
        type
        writer
        year
        ],
        keyword_init: true
      )

      Collection = Struct.new(
        *%i[
          search
          total_results
        ],
        keyword_init: true
      )

      Result = Struct.new(
        *%i[
          title
          year
          imdb_id
          type
          poster
        ],
        keyword_init: true
      )

      Error = Struct.new(
        :error,
        keyword_init: true
      )
    end
  end
end
