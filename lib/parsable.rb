module Parsable

  def parse_date(input_date)
    date_string = input_date.to_s
    corrected_digits = date_string[2..-1]
    ordered_array = corrected_digits.split('-').reverse
    ordered_array.join
  end
  
end
