require_relative 'movie'
require_relative 'reviewer'
require_relative 'snack_bar'

class Playlist

  def initialize name
    @name = name
    @movies = []
  end

  def add_movie movie
    @movies << movie
  end

  def play viewings
    puts "#{@name}'s Playlist:"

    puts @movies.sort

    snacks = SnackBar::SNACKS
    puts "There are #{snacks.size} snacks available in the Snack Bar:"

    snacks.each { |snack| puts "#{snack.name} has #{snack.carbs}."}

    1.upto(viewings) do |count|
      puts "\nViewing #{count}:"
      @movies.each do |movie|
        Reviewer.review movie
        snack = SnackBar.random
        puts "#{movie.title} led to #{snack.carbs} #{snack.name} carbs being consumed."
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
