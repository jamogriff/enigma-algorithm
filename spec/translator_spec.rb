require './lib/sequencer'

RSpec.describe Translator do
  describe 'initialization' do
    new_translator = Translator.new("h", :A)

    it 'exists and can access its attributes' do
      expect(new_translator).to be_instance_of Translator
      expect(new_translator.character).to eq "h"
      expect(new_translator.shift).to eq :A
    end
  end
end
