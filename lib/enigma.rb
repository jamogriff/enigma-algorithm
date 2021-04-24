require './lib/key'
require './lib/offset_generator'

class Enigma
  attr_accessor :keygen, :offset_gen

  def initialize
    @keygen = Key.generate
    @offset_gen = OffsetGenerator.new(date)
  end

  def encrypt(message, key=Key.generate, date=Date.today)
    codebook = CodeBook.new(key, date)

    {
      encryption: "lol message here",
      key: key,
      date: codebook.date)
      }
  end

  def code_book
    code_book = {}
    shift_type = [:A, :B, :C, :D]

    shift_type.each do |letter|
      key = keygen.generate(letter)
      offset = offset_gen.generate(letter)
      code_book[letter] = {
        key: key,
        offset: offset,
        sum: key + offset
      }
    end
    code_book
  end

end
