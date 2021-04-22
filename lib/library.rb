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

  def self.code_book
    code_book = {}
    shift_type = [:A, :B, :C, :D]

    shift_type.each do |letter|
      code_book[letter] = {
        # key: get_key_from_rng(letter),
        # offset: get_offset_from_date(letter)
      }
    end
  end

end
