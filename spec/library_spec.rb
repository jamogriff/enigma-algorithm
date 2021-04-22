require './lib/library'

RSpec.describe Library do

  it 'contains character set' do
    expect(Library.character_set.length).to eq 27
  end

  xit 'houses reference to underlying shift algorithm' do
    expect(Library.code_book[:B]).to eq 2
    expect(Library.code_book[:D]).to eq 4
  end

end
