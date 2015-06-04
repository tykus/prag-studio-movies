require_relative 'movie'
require_relative 'reviewer'
require_relative 'snack_bar'

module Flicks
  class Playlist

    def initialize name
      @name = name
      @movies = []
    end

    def load(from_file)
      full_path = File.expand_path(from_file)
      File.readlines(full_path).each do |line|
        add_movie Movie.from_csv(line)
      end
    end

    def save(to_file="movie_rankings.csv")
      File.open(to_file, "w") do |file|
        @movies.sort.each do |movie|
          file.puts movie.to_csv
        end
      end
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
          movie.ate_snack snack
          puts movie
        end
      end

      puts @movies
    end

    def total_carbs_consumed
      @movies.reduce(0) do |sum, movie|
        sum + movie.carbs_consumed
      end
    end

    def print_stats
      puts "\n#{@name}'s stats:"

      puts "#{total_carbs_consumed} total carbs consumed."

      @movies.sort.each do |movie|
        puts "\n#{movie.title}'s snack totals:"
        movie.each_snack do |snack|
          puts "#{snack.carbs} total #{snack.name} carbs"
        end
        puts "#{movie.carbs_consumed} total carbs consumed."
      end

      hits, flops = @movies.partition { |movie| movie.hit? }

      puts "\nHits:"
      puts hits

      puts "\nFlops:"
      puts flops

    end
  end
end
