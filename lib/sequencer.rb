class Translator
  attr_reader :character, :shift

  def initialize(character, shift_type)
    @character = character
    @shift = shift_type
  end

end
