class KeyGenerator

  # Designed to initialize with an array of 5 numbers
  def initialize(number)
    @seed = number
  end

  def generate(shift_type)
    case shift_type
    when :A
      key = @seed[0..1]
    when :B
      key = @seed[1..2]
    when :C
      key = @seed[2..3]
    when :D
      key = @seed[3..4]
    else
      key = [0, 0]
    end
    key.join.to_i
  end

end
