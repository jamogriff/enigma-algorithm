require './lib/code_book'

RSpec.describe CodeBook do
  describe 'initialization and shift reference' do
    codebook = CodeBook.new("02715", "040895")
    expected_key_code = [0, 2, 7, 1, 5]
    expected_date_code = [1, 0, 2, 5]

    it 'exists and accesses attributes' do
      expect(codebook).to be_instance_of CodeBook
      expect(codebook.key_code).to eq expected_key_code
      expect(codebook.date_code). to eq expected_date_code
    end

    it 'returns four digit date code number' do
      expect(codebook.create_date_code("040895")).to eq expected_date_code
    end

    it 'can return valid key shifts' do
      expect(codebook.key_shift(:A)).to eq 02
      expect(codebook.key_shift(:B)).to eq 27
      expect(codebook.key_shift(:C)).to eq 71
      expect(codebook.key_shift(:D)).to eq 15
    end

    it 'can return valid offset shifts' do
      expect(codebook.offset_shift(:A)).to eq 1
      expect(codebook.offset_shift(:B)).to eq 0
      expect(codebook.offset_shift(:C)).to eq 2
      expect(codebook.offset_shift(:D)).to eq 5
    end

    it 'houses reference to underlying shifts' do
      expect(codebook.shifts[:B]).to be_instance_of Hash
      expect(codebook.shifts[:D][:key]).to eq 15
      expect(codebook.shifts[:A][:key]).to eq 02
      expect(codebook.shifts[:A][:offset]).to eq 1
      expect(codebook.shifts[:C][:offset]).to eq 2
      expect(codebook.shifts[:A][:sum]). to eq 3
    end
  end
end
