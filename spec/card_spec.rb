require "spec_helper"


module MemoryGame
  describe Card do

    context "initialize" do
      it "shouldn't be initialized without a letter" do
        expect{Card.new()}.to raise_error
      end

      it "should be initialized with a letter being defined" do
        card = Card.new("A")
        expect(card.letter).to eq "A"
      end

      it "should be initialized with matched equal to false" do
        card = Card.new("A")
        expect(card.matched).to eq false
      end

      it "shouldn't be initialized with any other character but a single letter setted on letter" do
        ["2", "wrong", "%"].each do |wrong_letter|
          expect{Card.new(wrong_letter)}.to raise_error
        end
      end


    end

  end  

end
