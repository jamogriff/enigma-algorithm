class User
  attr_reader :language, :program_selection, :file

  def initialize(language)
    @language = language
    @program_selection = nil
  end

  def welcome_user
    Message.begin_program(language)
  end

  def choose_option
    option_check = false
    while option_check == false do
      Message.select_program(language)
      user_option = gets.chomp
      if (user_option == "1")
        option_check = true
        @program_selection = :encrypt
      elsif (user_option == "2")
        option_check = true
        @program_selection = :decrypt
      elsif (user_option == "3")
        Message.end_program(language)
        exit
      end
    end
  end

  def select_file_for_encryption
    file_check = false
    while file_check == false
      Message.select_encrypt_file(language)
      file_path = './data/' + gets.chomp
      if File.exist?(file_path)
        file_check = true
        @file = File.read(file_path)
      else
        Message.file_error(language)
      end
    end
  end

end
