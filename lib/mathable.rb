module Mathable

  # Returns an array of random numbers of chosen length
  def generate_random_number(length)
    index = 0
    random_num = []
    while index < length do
      random_num << rand(0..9)
      index += 1
    end
    random_num
  end

end
