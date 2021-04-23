require './lib/mathable'

class CaesarCipher
  include Mathable
  attr_accessor :keygen, :offset_gen

  def initialize(date_object)
    @keygen = KeyGenerator.new
    @offset_gen = OffsetGenerator.new(date_object)
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
