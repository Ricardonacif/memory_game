require_relative "../lib/memory_game.rb"

system('clear')
puts "Welcome to the Memory Game! \n"

first_name, second_name, coordinates = "", "", []

while first_name.empty?
  puts "Please type the first player name: "
  first_name = gets.chomp
end

system('clear')

while second_name.empty?
  puts "Now type the second player name: "
  second_name = gets.chomp  
end

system('clear')

while coordinates.empty?
  puts "Now type the size of the grid (e.g 2,2)"
  coordinates = gets.chomp  
  coordinates = coordinates.split(",").map { |c| c.strip.to_i }
  coordinates = [] unless coordinates.size == 2 && coordinates.all? {|x| x.is_a? Integer}
end

system('clear')

first_player = MemoryGame::Player.new(first_name)
second_player = MemoryGame::Player.new(second_name)

MemoryGame::Game.new(players: [first_player, second_player], grid_size: coordinates).start

