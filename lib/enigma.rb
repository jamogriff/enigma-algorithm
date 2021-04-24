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

  def translate_character(char, shift)

  end

  def character_set
    ("a".."z").to_a << " "
  end


end
