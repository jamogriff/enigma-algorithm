require './lib/key_generator'

RSpec.describe KeyGenerator do
  describe 'key generation' do
    keygen = KeyGenerator.new

    it 'can return valid keys' do
      allow(keygen).to receive(:generate_random_number) do
        [0, 2, 7, 1, 5]
      end
      expect(keygen.generate(:A)).to eq 02
      expect(keygen.generate(:B)).to eq 27
      expect(keygen.generate(:C)).to eq 71
      expect(keygen.generate(:D)).to eq 15
    end
  end
end
