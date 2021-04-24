require './lib/enigma'
require './lib/key'
require './lib/offset_generator'

RSpec.describe Enigma do
  describe 'initialization and reference to code book' do
    test_numbers = [0, 2, 7, 1, 5]
    current_date = Date.new(1995, 8, 4)
    enigma = Enigma.new

    it 'exists and accesses proper attributes' do
      expect(enigma).to be_instance_of Enigma
      expect(enigma.keygen).to be_instance_of Key
      expect(enigma.offset_gen).to be_instance_of OffsetGenerator
    end

  end
end
