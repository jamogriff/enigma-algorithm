require './lib/key'
require './lib/code_book'
require './lib/parsable'

class Enigma
  include Parsable
  attr_reader :key, :date

  def initialize
    @key = Key.generate
    @date = parse_date(Date.today)
  end

  def encrypt(message, default_key = key, default_date = date)
    # require 'pry'; binding.pry
    @codebook = CodeBook.new(default_key, default_date)

    {
      encryption: "lol message here",
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

  def character_set
    ("a".."z").to_a << " "
  end


end
