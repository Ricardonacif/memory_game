module MemoryGame
  class Game

    attr_reader :players, :board, :current_player, :other_player
    attr_accessor :first_pick_card, :second_pick_card,  :first_pick_coordinates, :second_pick_coordinates
    
    def initialize(args)
      @players = args.fetch(:players)
      rows, columns = args.fetch(:grid_size, [3,2])
      @board = Board.new(rows, columns)
      @current_player, @other_player = players.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def solicit_pick  
      ask_to_pick = if first_pick_card
        "#{current_player.name}, now pick another card to see if they match!" 
      else
        "#{current_player.name}, it's your turn now!" 
      end
      ask_to_pick + " Type the X and Y coordinates separeted by comma to pick a card. Make sure they're available in the grid."

    end

    def get_coordinates(coordinates = gets.chomp)

      coordinates.split(",").map { |c| c.strip.to_i }
    end

    def game_over?
      board.all_cards_matched?
    end

    def game_over_message
      return 'Oh :/ the game ended in a tie. Better luck next time!' if current_player.matches_count == other_player.matches_count
      winner = current_player.matches_count > other_player.matches_count ? current_player : other_player
      return "Congratulations #{winner.name}! You won!"
    end


    def picks_match?
      first_pick_card == second_pick_card
    end

    def display_scoreboard
      "The current scoreboard is: #{@players[0].name}: #{@players[0].matches_count} VS #{@players[1].name}: #{@players[1].matches_count}"
    end

    def validate_pick coordinates
      return false, "The coordinates were invalid." if is_a_invalid_position?(coordinates)
      return false, "You can't pick the same card twice." if is_the_same_pick_from_first?
      return true, ''
    end

    def is_a_invalid_position? coordinates
      card = board.get_card(coordinates)
      return true if card.nil? || card.matched
      false
    end

    def is_the_same_pick_from_first?
      if @first_pick_card
        return true if first_pick_coordinates == second_pick_coordinates 
      end
      false
    end

    def start
      puts "#{current_player.name} was randomly selected as the first player. Good Luck!"
      while true
        board.formatted_grid
        
        while @first_pick_card.nil?
          puts solicit_pick
          @first_pick_coordinates = get_coordinates
          valid, message = validate_pick(first_pick_coordinates)
          @first_pick_card = board.get_card(first_pick_coordinates) if valid
          puts message
        end

        board.formatted_grid(first_pick_coordinates)

        while @second_pick_card.nil?
          puts solicit_pick
          @second_pick_coordinates = get_coordinates
          valid, message = validate_pick(second_pick_coordinates)
          @second_pick_card = board.get_card(second_pick_coordinates) if valid
          puts message
        end
        board.formatted_grid(first_pick_coordinates, second_pick_coordinates)

        if player_scored?
          puts "Great! #{current_player.name}'s just scored!"
        else
          "Oh! #{current_player.name} didn't scored this turn."
        end
        
        
        if game_over?
          puts game_over_message
          return
        else
          reset_game_variables
          switch_players
        end
      end

    end
    
    private

    def player_scored?
      if first_pick_card == second_pick_card
        @first_pick_card.matched = true
        @current_player.matches_count += 1
        true
      else
        false
      end
    end

    def reset_game_variables
      @first_pick_coordinates, @first_pick_card, @second_pick_coordinates, @second_pick_card = nil
    end
  end
end
