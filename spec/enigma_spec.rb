require './lib/enigma'
require './lib/key'
require './lib/code_book'

RSpec.describe Enigma do
  describe 'initialization and encryption' do
    test_numbers = [0, 2, 7, 1, 5]
    current_date = Date.new(1995, 8, 4)
    enigma = Enigma.new

    it 'exists' do
      expect(enigma).to be_instance_of Enigma
      expect(enigma.key).to be_instance_of String
      expect(enigma.date).to be_instance_of String
    end

    it 'returns default values for encryption hash' do
      allow(enigma).to receive(:key) { "02715" }
      allow(enigma).to receive(:date) { "040895" }
      encryption = enigma.encrypt("hello world")
      expect(encryption[:key]).to eq "02715"
      expect(encryption[:date]).to eq "040895"
    end

    it 'returns key and date values when entered by user' do
      encryption = enigma.encrypt("hello world", "02715", "040895")
      expect(encryption[:key]).to eq "02715"
      expect(encryption[:date]).to eq "040895"
    end

    it 'correctly encrypts message' do
      encryption = enigma.encrypt("hello world", "02715", "040895")
      expect(encryption[:encryption]).to eq "keder ohulw"
    end

    it 'includes data set to translate characters' do
      expect(enigma.character_set.length).to eq 27
    end

    it 'can translate character and skip special characters' do
      # instantiating because encrypt creates CodeBook
      encryption = enigma.encrypt("hello world", "02715", "040895")
      expect(enigma.encrypt_character("h", :A)).to eq "k"
      expect(enigma.encrypt_character("@", :B)).to eq "@"
    end

    it 'can relate index to shift type' do
      expect(enigma.index_to_shift(19)).to eq :D
      expect(enigma.index_to_shift(13)).to eq :B
      expect(enigma.index_to_shift(72)).to eq :A
      expect(enigma.index_to_shift(99)).to eq :D
    end

  end
end
