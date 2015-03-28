class Movie

  attr_reader :title, :rank

	def initialize(title, rank=0)
    @title = title.capitalize
    @rank = rank
  end

  def thumbs_up
    @rank += 1
  end

  def thumbs_down
    @rank -= 1
  end

  def hit?
    @rank >= 10
  end

  def status
    hit? ? "Hit" : "Flop"
  end

  def <=>(other)
    other.rank <=> @rank
  end

  def to_s
    "#{@title} has a rank of #{@rank}"
  end
end

if __FILE__ === $0
  movie = Movie.new("goonies", 10)
  puts movie
  movie.thumbs_up
  puts movie
end
