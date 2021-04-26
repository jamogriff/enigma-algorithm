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
      allow(enigma).to receive(:date) { "950804" }
      encryption = enigma.encrypt("hello world")
      expect(encryption[:key]).to eq "02715"
      expect(encryption[:date]).to eq "950804"
    end

    it 'returns key and date values when entered by user' do
      encryption = enigma.encrypt("hello world", "02715", "950804")
      expect(encryption[:key]).to eq "02715"
      expect(encryption[:date]).to eq "950804"
    end

    it 'correctly encrypts message' do
      encryption = enigma.encrypt("hello world", "02715", "950804")
      expect(encryption[:encryption]).to eq "keder ohulw"
    end

    it 'includes data set to translate characters' do
      expect(enigma.character_set.length).to eq 27
    end

    it 'can translate character and skip special characters' do
      # instantiating because encrypt creates CodeBook
      encryption = enigma.encrypt("hello world", "02715", "950804")
      expect(enigma.encrypt_character("h", :A)).to eq "k"
      expect(enigma.encrypt_character("@", :B)).to eq "@"
    end

    it 'can relate index to shift type' do
      expect(enigma.index_to_shift(19)).to eq :D
      expect(enigma.index_to_shift(13)).to eq :B
      expect(enigma.index_to_shift(72)).to eq :A
      expect(enigma.index_to_shift(99)).to eq :D
    end

    it 'returns correct shift' do
      encryption = enigma.encrypt("hello world", "02715", "950804")
      expect(enigma.find_shift(:A)).to eq 3
    end

    it 'returns correct character index' do
      expect(enigma.find_char_index("a")).to eq 0
      expect(enigma.find_char_index("d")).to eq 3
    end

    it 'correctly decrypts message' do
      decryption = enigma.decrypt("keder ohulw", "02715", "950804")
      expect(decryption[:decryption]).to eq "hello world"
    end

    it 'correctly decrypts character' do
      decryption = enigma.decrypt("keder ohulw", "02715", "950804")
      expect(enigma.decrypt_character("k", :A)).to eq "h"
      expect(enigma.decrypt_character("@", :B)).to eq "@"
    end
  end
end
