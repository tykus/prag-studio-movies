require 'flicks/snack_bar'

module Flicks

  describe Snack do

    before do
      @snack = Snack.new(:pretzel, 10)
    end

    it "has a name attribute" do
      expect(@snack.name).to eq(:pretzel)
    end

    it "has a carbs attribute" do
      expect(@snack.carbs).to equal(10)
    end

  end

end

module Flicks

  describe SnackBar do

    it "has snacks" do
      expect(SnackBar::SNACKS).not_to be_empty
    end

    it "returns a random snack" do
      snack = SnackBar.random
      expect(SnackBar::SNACKS).to include(snack)
    end

  end

end
