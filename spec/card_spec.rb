require "spec_helper"


module MemoryGame
  describe Card do

    context "initialize" do
      it "shouldn't be initialized without a letter" do
        expect{Card.new()}.to raise_error(ArgumentError)
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
          expect{Card.new(wrong_letter)}.to raise_error(ArgumentError)
        end
      end
    end

    context "#to_s" do
      subject do
        Card.new("A")
      end

      it "should return a '-' when it wasn't matched neither picked" do
        expect(subject.to_s).to eq '-'
      end

      it "should return a blank space when it was already matched" do
        subject.matched = true
        expect(subject.to_s).to eq ' '
      end

      it "should return a it's letter when it was chosen" do
        expect(subject.to_s(true)).to eq 'A'
      end


    end


  end  

end
