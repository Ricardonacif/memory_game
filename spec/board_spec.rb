require "spec_helper"


module MemoryGame
  describe Board do

    context "initialize" do
      it "shouldn't be initialized without a size" do
        expect{Board.new()}.to raise_error
      end

      it "shouldn't be initialized without a size if the number of columns multiplied by the number of rows isn't an even number" do
        expect{Board.new(3,1)}.to raise_error
      end

      it "should be initialized with a the number of rows and columns" do
        board = Board.new(2,3)
        expect(board.rows).to eq 2
        expect(board.columns).to eq 3
      end

      it "should be initialized with a matrix of cards instances" do
        board = Board.new(2,3)
        expect(board.card_matrix[1,1].class).to eq MemoryGame::Card
      end      

      it "should be initialized with a matrix of cards instances" do
        board = Board.new(2,3)
        expect(board.card_matrix[1,1].class).to eq MemoryGame::Card
      end

      it "cards_matrix should containing each card duplicated twice" do
        
      end
    end

  end  
end

