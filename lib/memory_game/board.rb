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
    end


    def validate_matrix_size
      raise ArgumentError, "The number of columns multiplied by the number of rows should equal an even number" unless (@rows*@columns)%2 == 0 
    end

  end
end
