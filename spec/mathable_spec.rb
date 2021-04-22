require './lib/mathable'

RSpec.describe Mathable do
  include Mathable

  it 'generates a random number' do
    expect(generate_random_number(5).length).to eq 5
    expect(generate_random_number(10)).to be_instance_of Integer
  end

end
