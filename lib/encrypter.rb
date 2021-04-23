class Encrypter
  attr_reader :input_string

  def initialize(input)
    @input_string = input
  end

  def character_set
    ("a".."z").to_a << " "
  end

  def translate_character(char)
  end

end
