require 'rspec'
require './lib/shift_reference'


RSpec.describe Shift_Reference do
  test_array = [0, 2, 7, 1, 5]
  it 'can return valid keys' do
    expect(keygen.generate(:A)).to eq 02
    expect(keygen.generate(:B)).to eq 27
    expect(keygen.generate(:C)).to eq 71
    expect(keygen.generate(:D)).to eq 15
  end
end
