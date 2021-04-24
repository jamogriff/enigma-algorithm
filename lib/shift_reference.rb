class ShiftReference

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
    key.join
  end
  
end
