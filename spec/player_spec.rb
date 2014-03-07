require "spec_helper"


module MemoryGame
  describe Player do

    context "initialize" do
      it "shouldn't be initialized without a name" do
        expect{Player.new()}.to raise_error
      end

      it "should be initialized with a name" do
        player = Player.new("John")
        expect(player.name).to eq "John"
      end

      it "should be initialized matchs_count defaulting to 0" do
        player = Player.new("John")
        expect(player.matches_count).to eq 0
      end


    end

  end  

end
