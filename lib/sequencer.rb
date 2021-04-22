class Sequencer
  attr_reader :string, :shift

  def initialize(input, shift_type)
    @string = input
    @shift = shift_type
  end

end
