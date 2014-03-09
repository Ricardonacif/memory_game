module MemoryGame
  class Card
    
    attr_reader :letter
    attr_accessor :matched

    def initialize(letter)
      self.letter = letter
      @matched = false
      
    end


    def letter= (letter)
      if ('A'..'Z').to_a.include?(letter)
        @letter = letter
      else
        raise ArgumentError, "Letter should be a single letter character" 
      end      
    end

    def to_s(picked=false)
      if picked
        @letter
      else
        @matched ? ' ' : '-'
      end      
    end
  end
end
