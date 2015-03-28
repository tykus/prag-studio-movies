#! /usr/bin/env ruby

require_relative '../lib/playlist'

movie1 = Movie.new("goonies", 10)
movie2 = Movie.new("ghostbusters", 9)
movie3 = Movie.new("goldfinger")

playlist1 = Playlist.new("My")
playlist1.add_movie(movie1)
playlist1.add_movie(movie2)
playlist1.add_movie(movie3)

playlist1.play(3)
playlist1.print_stats
