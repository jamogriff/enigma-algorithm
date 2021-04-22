class OffsetGenerator
  attr_reader :date

  def initialize(date)
    @date = date.to_s
  end



  def parse_input_date
    corrected_digits = date[2..-1]
    ordered_array = corrected_digits.split('-').reverse
    ordered_array.join.to_i
  end

  def date_code
    square = parse_input_date**2
    trimmed_chars = square.to_s[-4..-1]
    trimmed_chars.to_i
  end



  def generate(shift_type)
    case shift_type
    when :A

    when :B

    when :C

    when :D

    else
      "Lol build l8r"
    end
  end


end
