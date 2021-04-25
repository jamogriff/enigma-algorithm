require './lib/enigma'
require './lib/message'
require './lib/user'
require 'pry'

Message.home_screen
Message.select_language
user = User.new(gets.chomp)

user.welcome_user
user.choose_option
enigma = Enigma.new

if user.program_selection == :encrypt
  user.select_file_for_encryption
  encryption = enigma.encrypt(user.file)
  user.select_file_destination
  File.new(user.new_filepath, "w")
  File.write(user.new_filepath, encryption[:encryption], mode: "w")
  puts "Aww yeah, time to encrypt with #{user.file}"
elsif user.program_selection == :decrypt
  # user.select_file
  # user.enter_credentials
  puts "oh okay, let's decrypt"
else
  "lol wut"
end
