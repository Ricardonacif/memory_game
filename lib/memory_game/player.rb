module MemoryGame
  class Player
    attr_reader :name
    attr_accessor :matches_count

    def initialize(name)
      @name = name
      @matches_count = 0
    end

  end

end