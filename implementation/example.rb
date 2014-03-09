require_relative "../lib/memory_game.rb"

first_player = MemoryGame::Player.new("Ricardo")
second_player = MemoryGame::Player.new("Joao")

MemoryGame::Game.new(players: [first_player, second_player], grid_size: [2,2]).start

