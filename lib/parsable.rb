module Parsable

  def parse_human_readable_date(input_date)
    date_string = input_date.to_s
    corrected_digits = date_string[2..-1]
    clean_array = corrected_digits.split('-')
    clean_array.join
  end

  def parse_date_for_code(parsed_date)
    array_of_chars = parsed_date.scan /.{1,2}/
    array_of_chars.reverse.join
  end

  def parse_string_to_array(string, type = :string)
    if type == :int
      string.split(//).map do |char|
        char.to_i
      end
    else
      string.split(//).map do |char|
        char
      end
    end
  end

end
