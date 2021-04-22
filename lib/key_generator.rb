require './lib/mathable'

class KeyGenerator
  include Mathable

  def generate(shift_type)
    case shift_type
    when :A
      key = generate_random_number(5)[0..1]
    when :B
      key = generate_random_number(5)[1..2]
    when :C
      key = generate_random_number(5)[2..3]
    when :D
      key = generate_random_number(5)[3..4]
    else
      key = [0, 0]
    end
    key.join.to_i
  end

end
