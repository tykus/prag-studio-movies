require_relative 'movie'
require_relative 'die'

class Playlist

  def initialize name
    @name = name
    @movies = []
  end

  def add_movie movie
    @movies << movie
  end

  def play
    number_rolled = Die::roll
    @movies.each do |movie|
      case number_rolled
      when 1..2
        movie.thumbs_down
      when 5..6
        movie.thumbs_up
      end
      puts movie
    end
    puts @movies
  end
end
