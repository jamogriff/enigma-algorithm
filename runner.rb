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
  Message.successful_encryption(user.language, user.new_filepath, encryption[:key], encryption[:date])
elsif user.program_selection == :decrypt
  user.select_file_for_decryption
  decryption = enigma.decrypt(user.file, user.get_key_input, user.get_date_input)
  user.select_file_destination
  File.new(user.new_filepath, "w")
  File.write(user.new_filepath, decryption[:decryption], mode: "w")
  Message.successful_encryption(user.language, user.new_filepath, decryption[:key], decryption[:date])
else
  "lol wut"
end
