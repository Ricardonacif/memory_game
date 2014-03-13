require "memory_game/version"
require 'pry'

module MemoryGame
end

lib_path = File.expand_path(File.dirname(__FILE__))

Dir[lib_path + "/memory_game/**/*.rb"].each { |file| require file }