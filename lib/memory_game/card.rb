module MemoryGame
  class Card
    
    attr_reader :position, :letter
    attr_accessor :matched

    def initialize(input)
      @letter = input.fetch(:letter).upcase
      @position = input.fetch(:position)
      @matched = false
      
      validate()
    end

    private

    def validate
      raise ArgumentError, "Letter should be a single letter character" unless ('A'..'Z').to_a.include?(@letter)  
    end

  end
end
