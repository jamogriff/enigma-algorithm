require './lib/mathable'

class KeyGenerator
  include Mathable

  def generate(shift_type)
    case shift_type
    when :A
      key = generate_random_number(5)[0..1]
      key.join.to_i
    when :B
      key = generate_random_number(5)[1..2]
      key.join.to_i
    when :C
      key = generate_random_number(5)[2..3]
      key.join.to_i
    when :D
      key = generate_random_number(5)[3..4]
      key.join.to_i
    else
      key = 000000
    end
  end

end
