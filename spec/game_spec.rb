require "spec_helper"

module MemoryGame
  describe Game do

    let (:john) { Player.new("John") }
    let (:frank) { Player.new("Frank") }
    let (:game) { Game.new(players: [john, frank]) }

    context "#initialize" do
      it "randomly selects a current_player" do
        Array.any_instance.stub(:shuffle) { [frank, john] }
        expect(game.current_player).to eq frank
      end

      it "randomly selects an other player" do
        Array.any_instance.stub(:shuffle) { [frank, john] }
        expect(game.other_player).to eq john
      end
    end

    context "#switch_players" do
      it "will set @current_player to @other_player" do
        other_player = game.other_player
        game.switch_players
        expect(game.current_player).to eq other_player
      end

      it "will set @other_player to @current_player" do
        current_player = game.current_player
        game.switch_players
        expect(game.other_player).to eq current_player
      end
    end

    context "#solicit_pick" do
      it "asks the player to pick a coordinate with 2 different phrases" do
        game.stub(:current_player) { john }
        expected = "John, it's your turn now! Type the column and row coordinates separeted by comma to pick a card (e.g 1,0). Make sure they're available in the grid."
        expect(game.solicit_pick).to eq expected
        game.first_pick_card = Card.new("A")
        expected = "John, now pick another card to see if they match! Type the column and row coordinates separeted by comma to pick a card (e.g 1,0). Make sure they're available in the grid."
        expect(game.solicit_pick).to eq expected
      end
    end

    context "#get_coordinates" do
      it "converts the input of '1,2' to [1, 2]" do
        expect(game.get_coordinates("1, 2")).to eq [1, 2]
      end

      it "converts human_move of '2, 2' to [2, 2]" do
        expect(game.get_coordinates("0,2")).to eq [0, 2]
      end
    end

    context "#picks_match?" do
      it "returns true if the player has found a match between two cards picked" do
        card = Card.new('A')
        game.first_pick_card = card
        game.second_pick_card = card
        expect(game.picks_match?).to eq true
      end
      
      it "returns false if the player hasn't found a match between two cards picked" do
        game.first_pick_card = Card.new('A')
        game.second_pick_card = Card.new('B')
        expect(game.picks_match?).to eq false
      end

    end

    context "#display_scoreboard" do
      it "returns 'The current scoreboard is: John: 1 VS Frank: 0' " do
        Array.any_instance.stub(:shuffle) { [frank, john] }
        john.matches_count = 1
        expect(game.display_scoreboard).to eq 'The current scoreboard is: John: 1 VS Frank: 0'
      end

    end

    context "#game_over?" do

      it "returns false if any pair of cards remains unmatched" do
        expect(game.game_over?).to eq false
      end

      it "returns true if all the cards where matched" do
        game.board.card_matrix.each { |c| c.matched = true }
        expect(game.game_over?).to eq true
      end

    end

    context "#game_over_message" do

      it "returns 'Congratulations John! You won!' if john wins the game" do
        game.stub(:current_player) { john }
        game.current_player.matches_count = 3
        
        game.stub(:other_player) { frank }
        frank.matches_count = 0

        game.stub(:game_over?) { true }
        expect(game.game_over_message).to eq 'Congratulations John! You won!'
      end

      it "returns 'Oh :/ the game ended in a tie. Better luck next time!'" do
        game.stub(:current_player) { john }
        john.matches_count = 3

        game.stub(:other_player) { frank }
        frank.matches_count = 3
        
        game.stub(:game_over?) { true }
        expect(game.game_over_message).to eq 'Oh :/ the game ended in a tie. Better luck next time!'
      end
    end

    context "#is_the_same_pick_from_first?" do

      it "should return true if the second pick is the same as the first" do
        game.first_pick_coordinates = [0,0]
        game.first_pick_card = Card.new('A')
        game.second_pick_coordinates = [0,0]
        expect(game.is_the_same_pick_from_first?).to eq true
      end

      it "should return false if the second pick is different than the first" do
        game.first_pick_coordinates = [0,0]
        game.first_pick_card = Card.new('A')
        game.second_pick_coordinates = [0,1]
        expect(game.is_the_same_pick_from_first?).to eq false
      end

    end

  end
end