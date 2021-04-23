require './lib/caesar_cipher'
require './lib/key_generator'
require './lib/offset_generator'

RSpec.describe CaesarCipher do
  describe 'initialization and reference to code book' do
    current_date = Date.new(1995, 8, 4)
    cipher = CaesarCipher.new(current_date)

    it 'exists and accesses proper attributes' do
      expect(cipher).to be_instance_of CaesarCipher
      expect(cipher.keygen).to be_instance_of KeyGenerator
      expect(cipher.offset_gen).to be_instance_of OffsetGenerator
    end

    it 'houses reference to underlying shift algorithm' do
      allow(cipher.keygen).to receive(:generate_random_number) do
        [0, 2, 7, 1, 5]
      end
      expect(cipher.code_book[:B]).to be_instance_of Hash
      expect(cipher.code_book[:D][:key]).to eq 15
      expect(cipher.code_book[:A][:key]).to eq 02
      expect(cipher.code_book[:A][:offset]).to eq 1
      expect(cipher.code_book[:C][:offset]).to eq 2
    end
  end
end
