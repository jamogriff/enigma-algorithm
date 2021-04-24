require './lib/enigma'
require './lib/key_generator'
require './lib/offset_generator'

RSpec.describe Enigma do
  describe 'initialization and reference to code book' do
    test_numbers = [0, 2, 7, 1, 5]
    current_date = Date.new(1995, 8, 4)
    enigma = Enigma.new(test_numbers, current_date)

    it 'exists and accesses proper attributes' do
      expect(enigma).to be_instance_of Enigma
      expect(enigma.keygen).to be_instance_of KeyGenerator
      expect(enigma.offset_gen).to be_instance_of OffsetGenerator
    end

    it 'houses reference to underlying shift algorithm' do
      expect(enigma.code_book[:B]).to be_instance_of Hash
      expect(enigma.code_book[:D][:key]).to eq 15
      expect(enigma.code_book[:A][:key]).to eq 02
      expect(enigma.code_book[:A][:offset]).to eq 1
      expect(enigma.code_book[:C][:offset]).to eq 2
      expect(enigma.code_book[:A][:sum]). to eq 3
    end
  end
end
