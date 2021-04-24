require './lib/caesar_cipher'
require './lib/random_number'
require './lib/message'
require './lib/user'
require 'date'
require 'pry'

Message.home_screen
Message.select_language
user = User.new(gets.chomp)

user.welcome_user
user.choose_option

if user.program_selection == :encrypt
  rng = RandomNumber.generate(5)
  date = Date.new(1995, 8, 4)
  new_cipher = CaesarCipher.new(rng, date)
  puts "Aww yeah, time to encrypt"
elsif user.program_selection == :decrypt
  puts "oh okay, let's decrypt"
else
  Message.file_error_en
end
