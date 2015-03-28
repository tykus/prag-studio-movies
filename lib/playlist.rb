require_relative 'movie'
require_relative 'reviewer'

class Playlist

  def initialize name
    @name = name
    @movies = []
  end

  def add_movie movie
    @movies << movie
  end

  def play viewings
    1.upto(viewings) do |count|
      puts "\nViewing #{count}:"
      @movies.each do |movie|
        Reviewer.review movie
        puts movie
      end
    end

    puts @movies
  end

  def print_stats
    puts "\n#{@name}'s stats:"

    hits, flops = @movies.partition { |movie| movie.hit? }

    puts "Hits:"
    puts hits

    puts "Flops:"
    puts flops

  end
end
