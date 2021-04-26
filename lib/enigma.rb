require './lib/key'
require './lib/code_book'
require './lib/parsable'
require 'date'

class Enigma
  include Parsable
  attr_reader :key, :date

  def initialize
    @key = Key.generate
    @date = parse_human_readable_date(Date.today)
  end

  def encrypt(message, default_key = key, default_date = date)
    @codebook = CodeBook.new(default_key, parse_date_for_code(default_date))
    encryption = parse_string_to_array(message).map.with_index do |char, index|
      encrypt_character(char,index_to_shift(index))
    end.join
    {
      encryption: encryption,
      key: default_key,
      date: default_date
      }
  end

  def encrypt_character(character, shift)
    downcase_char = character.downcase
    if character_set.include?(downcase_char)
      character_set[normalized_encryption_index(downcase_char, shift)]
    else
      character
    end
  end

  def decrypt(message, input_key, default_date = date)
    @codebook = CodeBook.new(input_key, parse_date_for_code(default_date))
    decryption = parse_string_to_array(message).map.with_index do |char, index|
      decrypt_character(char,index_to_shift(index))
    end.join
    {
      decryption: decryption,
      key: input_key,
      date: default_date
      }
  end

  def decrypt_character(character, shift)
    downcase_char = character.downcase
    if character_set.include?(downcase_char)
      character_set[normalized_decryption_index(downcase_char, shift)]
    else
      character
    end
  end

  def crack(message, default_date=@date)
    decrypted_message = message
    counter = 0
    while pattern_exists?(decrypted_message) == false
      new_key = Key.generate_optimized(counter)
      decryption = decrypt(message, new_key, default_date)
      decrypted_message = decryption[:decryption]
      counter += 1
      if counter == 100000
        puts "Error occured in cracking."
        break
      end
    end
    {
      decryption: decrypted_message,
      key: new_key,
      date: default_date,
      operations: counter
      }
  end

  # Indexes are off to account for newline character
  def pattern_exists?(message)
    if (message[-5..-2] =~ / end/) != nil
      true
    else
      false
    end
  end

  def normalized_encryption_index(character, shift_type)
    (find_char_index(character) + find_shift(shift_type)) % character_set.length
  end

  def normalized_decryption_index(character, shift_type)
    (find_char_index(character) - find_shift(shift_type)) % character_set.length
  end

  def index_to_shift(index)
    shift_map = {
      0 => :A, 1 => :B,
      2 => :C, 3 => :D
    }
    normalized_index = index % shift_map.keys.length
    shift_map[normalized_index]
  end

  def find_shift(shift_type)
    @codebook.shifts[shift_type][:sum]
  end

  def find_char_index(character)
    character_set.index(character)
  end

  def character_set
    ("a".."z").to_a << " "
  end
end
