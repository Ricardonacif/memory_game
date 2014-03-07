require "spec_helper"


module MemoryGame
  describe Card do

    context "initialize" do
      it "shouldn't be initialized without a position and a letter" do
        expect{Card.new()}.to raise_error
      end

      it "should be initialized with a position and a letter being defined" do
        card = Card.new({position: 1, letter: "A"})
        expect(card.position).to eq 1
        expect(card.letter).to eq "A"
      end

      it "should be initialized with matched equal to false" do
        card = Card.new({position: 1, letter: "A"})
        expect(card.matched).to eq false
      end

      it "shouldn't be initialized with any other character but a single letter setted on letter" do
        ["2", "wrong", "%"].each do |wrong_letter|
          expect{Card.new({position: 1, letter: wrong_letter})}.to raise_error
        end
      end


    end

  end  

end
