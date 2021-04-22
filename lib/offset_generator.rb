class OffsetGenerator
  attr_reader :date_code

  def initialize(date)
    @date_code = create_date_code(date)
  end

  def create_date_code(date)
    squared = parse_input_date(date)**2
    trimmed_chars = squared.to_s[-4..-1]
    trimmed_chars.split(//).map do |char|
      char.to_i
    end
  end

  def generate(shift_type)
    case shift_type
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

  def parse_input_date(date)
    date_string = date.to_s
    corrected_digits = date_string[2..-1]
    ordered_array = corrected_digits.split('-').reverse
    ordered_array.join.to_i
  end

end
