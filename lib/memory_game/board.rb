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




    private

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
