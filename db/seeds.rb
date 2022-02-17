# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'



Movie.delete_all
i=0

  url = 'http://tmdb.lewagon.com/movie/top_rated'
  movie_serialized = URI.open(url).read
  top_movies = JSON.parse(movie_serialized)
    while i < 20
    movie = Movie.new(title: top_movies["results"][i]["title"], overview: top_movies["results"][i]["overview"], rating: top_movies["results"][i]["vote_average"]/2)
    i += 1
    movie.save
    puts movie.title
    puts movie.overview
    puts movie.rating
    end
