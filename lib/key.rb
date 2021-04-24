class Key

  def self.generate
    index = 0
    random_numbers = []
    while index < 5 do
      random_numbers << rand(0..9)
      index += 1
    end
    random_numbers.join
  end
end
