class RandomNumber

  # Returns an array of random numbers of chosen length
  def self.generate(length)
    index = 0
    random_numbers = []
    while index < length do
      random_numbers << rand(0..9)
      index += 1
    end
    random_numbers
  end
end
