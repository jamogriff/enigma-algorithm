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

  def self.generate_optimized(num)
    possibilities ||= [0,1,2,3,4,5,6,7,8,9].repeated_permutation(5).to_a
    possibilities[num].join
  end
end
