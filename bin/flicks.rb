#! /usr/bin/env ruby

require_relative '../lib/playlist'

# movie1 = Movie.new("goonies", 10)
# movie2 = Movie.new("ghostbusters", 9)
# movie3 = Movie.new("goldfinger")

playlist = Playlist.new("Kermit")
playlist.load(ARGV.shift || "movies.csv")

loop do
  puts "\nHow many viewings? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    playlist.play(answer.to_i)
  when 'quit', 'exit'
    playlist.print_stats
    break
  else
    puts "Enter a number or 'quit'"
  end
end

playlist.save
