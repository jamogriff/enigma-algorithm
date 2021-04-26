require './lib/key'

RSpec.describe Key do
  describe 'key generation' do
    key = Key.generate

    it 'returns string of numbers' do
      expect(key).to be_instance_of String
      expect(key.length).to eq 5
      expect(key.to_i).to be_instance_of Integer
    end

    it 'returns optimized number generation' do
      expect(Key.generate_optimized(0)).to eq "00000"
      expect(Key.generate_optimized(1)).to eq "00001"
    end
  end
end
