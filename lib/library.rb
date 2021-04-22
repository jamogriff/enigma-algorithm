require './lib/mathable'

class Library
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
      code_book[letter] = {
        key: keygen.generate(letter),
        offset: offset_gen.generate(letter)
      }
    end
    code_book
  end
  
  def self.character_set
    ("a".."z").to_a << " "
  end

end
