require './lib/mathable'

class Library
  include Mathable
  attr_accessor :keygen, :date

  def initialize(date_time)
    @keygen = KeyGenerator.new
    @date = date_time
  end

  def self.character_set
    ("a".."z").to_a << " "
  end

  def code_book
    code_book = {}
    shift_type = [:A, :B, :C, :D]

    shift_type.each do |letter|
      code_book[letter] = {
        key: keygen.generate(letter)
        #offset: get_offset_from_date(letter)
      }
    end
    code_book
  end
end
