require './lib/random_number'

RSpec.describe RandomNumber do
  it 'generates a random number' do
    expect(RandomNumber.generate(5).length).to eq 5
    expect(RandomNumber.generate(10)[9]).to be_instance_of Integer
  end
end
