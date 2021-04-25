require './lib/parsable'

RSpec.describe Parsable do
  include Parsable

  it 'parses a date' do
    date = Date.new(1995, 8, 4)
    expect(parse_human_readable_date(date)).to eq "950804"
  end

  it 'parses a date into code format' do
    expect(parse_date_for_code("950804")).to eq "040895"
  end

  it 'parses string into array' do
    expect(parse_string_to_array("ab1d")).to eq ["a", "b", "1", "d"]
    expect(parse_string_to_array("1234", :int)).to eq [1, 2, 3, 4]
  end
end
