require './lib/parsable'

RSpec.describe Parsable do
  include Parsable

  it 'parses a date' do
    date = Date.new(1995, 8, 4)
    expect(parse_date(date)).to eq "040895"
  end
end
