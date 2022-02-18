# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
url = "http://tmdb.lewagon.com/movie/top_rated"

puts "Deleting movies"
Movie.destroy_all
puts "Movie deleted"


10.times do |m|
  movies = JSON.parse(URI.open("#{url}?page=#{m + 1}").read)['results']
  movies.each do |movie|
    puts "creating #{movie['title']}"
    base_poster_url = "https://image.tmdb.org/t/p/original"
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
      rating: movie['vote_average']
    )
  end
end

puts "Movies created"
List.create(name: "Most popular movies")
List.create(name: "Superheroes")
List.create(name: "Disney")
