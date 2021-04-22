require './lib/library'
require './lib/key_generator'

RSpec.describe Library do

  describe 'initialization' do
    current_time = Time.now
    repo = Library.new(current_time)

    it 'exists and accesses proper attributes' do
      expect(repo).to be_instance_of Library
      expect(repo.keygen).to be_instance_of KeyGenerator
      expect(repo.date).to be_instance_of Time
    end

    it 'contains character set' do
      expect(Library.character_set.length).to eq 27
    end

    it 'houses reference to underlying shift algorithm' do
      allow(repo.keygen).to receive(:generate_random_number) do
        [0, 2, 7, 1, 5]
      end
      expect(repo.code_book[:B]).to be_instance_of Hash
      expect(repo.code_book[:D][:key]).to eq 15
      expect(repo.code_book[:A][:key]).to eq 02
    end

  end

end
