require './lib/library'
require './lib/key_generator'
require './lib/offset_generator'

RSpec.describe Library do
  describe 'initialization and reference to code book' do
    current_date = Date.new(1995, 8, 4)
    repo = Library.new(current_date)

    it 'exists and accesses proper attributes' do
      expect(repo).to be_instance_of Library
      expect(repo.keygen).to be_instance_of KeyGenerator
      expect(repo.offset_gen).to be_instance_of OffsetGenerator
    end

    it 'houses reference to underlying shift algorithm' do
      allow(repo.keygen).to receive(:generate_random_number) do
        [0, 2, 7, 1, 5]
      end
      expect(repo.code_book[:B]).to be_instance_of Hash
      expect(repo.code_book[:D][:key]).to eq 15
      expect(repo.code_book[:A][:key]).to eq 02
      expect(repo.code_book[:A][:offset]).to eq 1
      expect(repo.code_book[:C][:offset]).to eq 2
    end
  end
end
