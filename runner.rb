require './lib/caesar_cipher'
require './lib/random_number'
require 'date'
require 'pry'

rng = RandomNumber.generate(5)
date = Date.new(1995, 8, 4)
new_cipher = CaesarCipher.new(rng, date)
binding.pry
