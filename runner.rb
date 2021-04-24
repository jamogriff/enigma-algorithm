require './lib/enigma'
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
  user.select_file_for_encryption
  rng = RandomNumber.generate(5)
  date = Date.new(1995, 8, 4)
  # enigma = Enigma.new(rng, date)
  puts "Aww yeah, time to encrypt with #{user.file}"
elsif user.program_selection == :decrypt
  # user.select_file
  # user.enter_credentials
  puts "oh okay, let's decrypt"
else
  "lol wut"
end
