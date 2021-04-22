require './lib/sequencer'

RSpec.describe Sequencer do
  describe 'initialization' do
    new_sequencer = Sequencer.new("hello world", :A)

    it 'exists and can access its attributes' do
      expect(new_sequencer).to be_instance_of Sequencer
      expect(new_sequencer.string).to eq "hello world"
      expect(new_sequencer.shift).to eq :A
    end
  end
end
