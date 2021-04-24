require './lib/file_reader'

RSpec.describe FileReader do
  describe 'initialization' do
    file = FileReader.new('./test.txt')

    it 'exists and accesses its attributes' do
      expect(file).to be_instance_of FileReader
      expect(file.path).to eq './test.txt'
      expect(file.file).to be_instance_of File
    end
  end

end
