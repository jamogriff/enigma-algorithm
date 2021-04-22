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

    xit 'houses reference to underlying shift algorithm' do
      expect(Library.code_book[:B]).to eq 2
      expect(Library.code_book[:D]).to eq 4
    end

  end

end
