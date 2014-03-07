module MemoryGame
  class Card
    
    attr_reader :letter
    attr_accessor :matched

    def initialize(letter)
      @letter = letter
      @matched = false
      
      validate()
    end

    private

    def validate
      raise ArgumentError, "Letter should be a single letter character" unless ('A'..'Z').to_a.include?(@letter)  
    end

  end
end
