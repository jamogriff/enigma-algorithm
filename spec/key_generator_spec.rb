require './lib/key_generator'

RSpec.describe KeyGenerator do
  describe 'key generation' do
    test_array = [0, 2, 7, 1, 5]
    keygen = KeyGenerator.new(test_array)

    it 'can return valid keys' do
      expect(keygen.generate(:A)).to eq 02
      expect(keygen.generate(:B)).to eq 27
      expect(keygen.generate(:C)).to eq 71
      expect(keygen.generate(:D)).to eq 15
    end
  end
end
