require './lib/offset_generator'

RSpec.describe OffsetGenerator do
  date = Date.new(1995, 8, 4)
  offset_gen = OffsetGenerator.new(date)

  it 'returns a date' do
    expect(offset_gen.date).to be_instance_of String
  end

  it 'parses a date into an integer code' do
    expect(offset_gen.parse_date_code).to eq 40895
  end

  xit 'returns valid offsets' do
    expect(offset_gen.generate(:A)).to eq 1
    expect(offset_gen.generate(:B)).to eq 0
    expect(offset_gen.generate(:C)).to eq 2
    expect(offset_gen.generate(:D)).to eq 5
  end
end
