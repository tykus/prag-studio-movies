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

  def play
    @movies.each do |movie|
      Reviewer.review movie
      puts movie
    end
    puts @movies
  end
end
