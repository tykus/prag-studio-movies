require_relative 'die'

module Flicks
  module Reviewer

    def self.roll_die
      die = Flicks::Die.new
      die.roll
    end

    def self.review(movie)
      number_rolled = roll_die
      case number_rolled
      when 1..2
        movie.thumbs_down
      when 5..6
        movie.thumbs_up
      end
    end

  end
end
