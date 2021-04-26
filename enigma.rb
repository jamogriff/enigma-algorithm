require './lib/enigma'
require './lib/message'
require './lib/user'
require 'pry'

runtime_loop = true
Message.home_screen
user = User.new(gets.chomp)
Message.begin_program(user.language)

while runtime_loop == true
  enigma = Enigma.new
  user.choose_option
  if user.program_selection == :encrypt
    encryption = enigma.encrypt(user.select_file)
    File.new(user.select_file_destination, "w")
    File.write(user.filepath, encryption[:encryption], mode: "w")
    Message.success(user.language, user.filepath, encryption[:key], encryption[:date])
  elsif user.program_selection == :decrypt
    decryption = enigma.decrypt(user.select_file, user.get_key_input, user.get_date_input)
    File.new(user.select_file_destination, "w")
    File.write(user.filepath, decryption[:decryption], mode: "w")
    Message.success(user.language, user.filepath, decryption[:key], decryption[:date])
  elsif user.program_selection == :crack
    encrypted_file = user.select_file
    File.new(user.select_file_destination, "w")
    date = user.get_date_input
    Message.start_crack(user.language)
    crack = enigma.crack(encrypted_file, date)
    File.write(user.filepath, crack[:decryption], mode: "w")
    Message.crack_success(user.language, user.filepath, crack[:key], crack[:date], crack[:operations])
  end
end
