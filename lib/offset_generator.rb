class OffsetGenerator
  attr_reader :date

  def initialize(date)
    @date = date.to_s
  end

  def parse_date_code
    corrected_digits = @date[2..-1]
    ordered_array = corrected_digits.split('-').reverse
    ordered_array.join.to_i
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
