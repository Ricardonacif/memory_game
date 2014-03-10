module MemoryGame
  class Board
    require 'matrix'


    attr_reader :rows, :columns
    attr_accessor :card_matrix

    def initialize(rows, columns)
      @rows = rows
      @columns = columns
      validate_matrix_size

      @card_matrix = build_initial_matrix
    end


    def formatted_grid(first_pick= nil, second_pick = nil)
      grid_header
      
      x = 0
      y = 0
      @card_matrix.each do |card|
        print y.to_s + ' ' if x == 0
        picked = ([x,y] == first_pick) || ([x,y] == second_pick)
        print card.to_s(picked) + " "
        x+= 1
        if x == @card_matrix.column_size
          print "\n"
          x = 0
          y+= 1
        end
      end
    end

    def get_card(card_coordinates)
      x, y = card_coordinates
      card_matrix[y, x]
    rescue
      return nil
    end

    def all_cards_matched?
      @card_matrix.all? {|c| c.matched}
    end

    private

    def grid_header
      print '  '
      @card_matrix.column_size.times {|i| print i.to_s + " "}
      print "\n"
    end


    def build_initial_matrix
      cards = random_cards_duplicated
      Matrix.build(@rows, @columns) { |row, col| cards.delete_at(rand(cards.length)) }
    end

    def random_cards_duplicated
      array_of_letters = ('A'..'Z').to_a
      cards = ((@rows * @columns)/2).times.map do 
        Card.new(array_of_letters.delete_at(rand(array_of_letters.length)))
      end
      cards * 2
    end

    def validate_matrix_size
      raise ArgumentError, "The number of columns multiplied by the number of rows should equal an even number" unless (@rows*@columns)%2 == 0
    end

  end
end
