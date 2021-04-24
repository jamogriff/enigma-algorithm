require './lib/parsable'

RSpec.describe Parsable do
  include Parsable

  it 'parses a date' do
    date = Date.new(1995, 8, 4)
    expect(parse_date(date)).to eq "040895"
  end

  it 'parses string into array' do
    expect(parse_string_to_array("abcd")).to eq ["a", "b", "c", "d"]
    expect(parse_string_to_array("1234", :int)).to eq [1, 2, 3, 4]
  end
end
