require './lib/file_reader'

RSpec.describe FileReader do
  xdescribe 'initialization' do
    file = FileReader.new('./data/test.txt')

    it 'exists and accesses its attributes' do
      expect(file).to be_instance_of FileReader
      expect(file.path).to eq './data/test.txt'
      expect(file.file).to be_instance_of File
    end
  end

end
