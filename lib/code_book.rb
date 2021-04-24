require './lib/parsable'

class CodeBook
  include Parsable
  attr_reader :key_code, :date_code

  def initialize(key, date)
    @key_code = parse_string_to_array(key, :int)
    @date_code = create_date_code(date)
  end

  def shifts
    reference = {}
    shift_types = [:A, :B, :C, :D]
    shift_types.each do |letter|
      reference[letter] = {
        key: key_shift(letter),
        offset: offset_shift(letter),
        sum: key_shift(letter) + offset_shift(letter)
      }
    end
    reference
  end

  def create_date_code(date)
    squared = date.to_i**2
    trimmed_chars = squared.to_s[-4..-1]
    parse_string_to_array(trimmed_chars, :int)
  end

  def offset_shift(offset_type)
    case offset_type
    when :A
      date_code[0]
    when :B
      date_code[1]
    when :C
      date_code[2]
    when :D
      date_code[3]
    else
      0
    end
  end

  def key_shift(key_type)
    case key_type
    when :A
      key = key_code[0..1]
    when :B
      key = key_code[1..2]
    when :C
      key = key_code[2..3]
    when :D
      key = key_code[3..4]
    else
      key = [0, 0]
    end
    key.join.to_i
  end

end
