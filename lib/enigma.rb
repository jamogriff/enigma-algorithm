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
    index = 0
    encryption = []
    parse_string_to_array(message).each do |char|
      encryption << encrypt_character(char,index_to_shift(index))
      index += 1
    end
    {
      encryption: encryption.join,
      key: default_key,
      date: default_date
      }
  end

  def index_to_shift(index)
    shift_map = {
      0 => :A, 1 => :B,
      2 => :C, 3 => :D
    }
    clock_index = index % shift_map.keys.length
    shift_map[clock_index]
  end

  def encrypt_character(character, shift)
    downcase = character.downcase
    if character_set.include?(downcase)
      char_index = character_set.index(character.downcase)
      shift_amount = @codebook.shifts[shift][:sum]
      clock_index = (char_index + shift_amount) % character_set.length
      character_set[clock_index]
    else
      character
    end
  end

  def decrypt(message, input_key, default_date = date)
    @codebook = CodeBook.new(input_key, parse_date_for_code(default_date))
    index = 0
    decryption = []
    parse_string_to_array(message).each do |char|
      decryption << decrypt_character(char,index_to_shift(index))
      index += 1
    end
    {
      decryption: decryption.join,
      key: input_key,
      date: default_date
      }
  end

  def decrypt_character(character, shift)
    downcase = character.downcase
    if character_set.include?(downcase)
      char_index = character_set.index(character.downcase)
      shift_amount = @codebook.shifts[shift][:sum]
      clock_index = (char_index - shift_amount) % character_set.length
      character_set[clock_index]
    else
      character
    end
  end

  def character_set
    ("a".."z").to_a << " "
  end

end
