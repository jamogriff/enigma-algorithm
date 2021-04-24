require 'fileutils'

class FileReader
  attr_reader :path

  def initialize(file_path)
    @path = file_path
    @file = File.open(@path, "r")
  end

  def read_file
    @file.each_line do |line|
      "lol"
    end
  end

  def delete_file(file)
    file.close
    File.delete(file)
  end

  def write_file(path)
    File.new(path, "w")
    File.open(path)
    File.write(config, "language: #{language}", mode: "w")
    # Append: File.write(config, "\nname: #{self.name}", mode: "a")
  end

  def exists?(path)
    File.exist?(path)
  end

end
