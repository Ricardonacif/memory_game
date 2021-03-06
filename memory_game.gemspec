# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'memory_game/version'

Gem::Specification.new do |spec|
  spec.name          = "memory_game"
  spec.version       = MemoryGame::VERSION
  spec.authors       = ["Ricardo Nacif"]
  spec.email         = ["ricardonacif@lancedavez.com.br"]
  spec.description   = "A Terminal Memory Game coded in Ruby Hacker School application proccess developed by Ricardo Nacif."
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
