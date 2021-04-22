require './lib/key_generator'

RSpec.describe KeyGenerator do

    keygen = KeyGenerator.new
    # Probably makes sense to move this out of this module...
    it 'can return valid keys' do
      allow(keygen).to receive(:generate_random_number) do
        [0, 2, 7, 1, 5]
      end
      expect(keygen.generate_key(:A)).to eq 02
      expect(keygen.generate_key(:B)).to eq 27
      expect(keygen.generate_key(:C)).to eq 71
      expect(keygen.generate_key(:D)).to eq 15
    end

end
