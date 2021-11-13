# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
require 'json'
require 'open-uri'
# instead of doing db:drop - this will clear data before creating again
Movie.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated'
movie_serialized = URI.open(url).read
movies = JSON.parse(movie_serialized)['results']
poster_url = "https://image.tmdb.org/t/p/w500"

movies.each do |movie|
  puts "creating #{movie['title']}"
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: poster_url + movie['poster_path'],
    rating: movie['vote_average']
  )
end
