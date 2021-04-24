class CodeBook
  attr_reader :full_key, :date, :date_code

  def initialize(key, date)
    @full_key = key.to_i
    @date = parse_date(date)
    @date_code = create_date_code
  end

  def shift_reference
    reference = {}
    shift_types = [:A, :B, :C, :D]

    shift_types.each do |letter|
      reference[letter] = {
        key: key_shift,
        offset: offset_shift,
        sum: key_shift + offset_shift
      }
    end
    reference
  end

  def parse_date(input_date)
    date_string = input_date.to_s
    corrected_digits = date_string[2..-1]
    ordered_array = corrected_digits.split('-').reverse
    ordered_array.join
  end

  def create_date_code
    squared = date.to_i**2
    trimmed_chars = squared.to_s[-4..-1]
    trimmed_chars.split(//).map do |char|
      char.to_i
    end
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
      key = @full_key[0..1]
    when :B
      key = @full_key[1..2]
    when :C
      key = @full_key[2..3]
    when :D
      key = @full_key[3..4]
    else
      key = [0, 0]
    end
    key.join.to_i
  end

end
