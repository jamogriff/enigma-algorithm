require './lib/key'
require './lib/code_book'
require './lib/parsable'

class Enigma
  include Parsable
  attr_accessor :keygen

  def initialize
    @keygen = Key.generate
  end

  def encrypt(message, key=Key.generate, date=Date.today)
    codebook = CodeBook.new(key, parse_date(date))

    {
      encryption: "lol message here",
      key: key,
      date: parse_date(date))
      }
  end

end
