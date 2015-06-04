require 'flicks/playlist'

module Flicks
  describe Playlist do

    before do
      $stdout = StringIO.new
      @playlist = Playlist.new("My Favorites")
    end

    context "being played with one movie" do

      before do
        @initial_rank = 10
        @movie = Movie.new("goonies", @initial_rank)
        @playlist.add_movie(@movie)
      end

      it "gives the movie a thumbs up if a high number is rolled" do
        allow_any_instance_of(Die).to receive(:roll).and_return(5)

        @playlist.play(1)

        expect(@movie.rank).to eq(@initial_rank + 1)
      end

      it "does not change ranking if a medium number is rolled" do
        allow_any_instance_of(Die).to receive(:roll).and_return(3)

        @playlist.play(1)

        expect(@movie.rank).to eq(@initial_rank)
      end

      it "gives the movie a thumbs down if a low number is rolled" do
        allow_any_instance_of(Die).to receive(:roll).and_return(1)

        @playlist.play(1)

        expect(@movie.rank).to eq(@initial_rank - 1)
      end

    end

  end
end