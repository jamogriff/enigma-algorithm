require './lib/encrypter'

RSpec.describe Encrypter do
  describe 'initialization' do
    # Encrypter is initialized with a string to be encrypted
    new_encrypter = Encrypter.new("hello world!")

    it 'exists and can access its attributes' do
      expect(new_encrypter).to be_instance_of Encrypter
      expect(new_encrypter.input_string).to eq "hello world!"
    end

    it 'includes data set to translate characters' do
      expect(new_encrypter.character_set.length).to eq 27
    end

    xit 'can translate one valid character with shift' do
      expect(new_encrypter.encrypt_character("h")).to eq "k"
    end
  end
end
