class FileReader
  attr_reader :path

  def initialize(file_path)
    @path = file_path
  end
end
