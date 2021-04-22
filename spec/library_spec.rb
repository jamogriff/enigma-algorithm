require './lib/library'

RSpec.describe Library do

  it 'houses reference to underlying shift algorithm' do
    expect(Library.code_book[:B]).to eq 2
    expect(Library.code_book[:D]).to eq 4
  end

end
