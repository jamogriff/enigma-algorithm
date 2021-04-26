class User
  attr_reader :language, :program_selection, :filepath

  def initialize(language)
    @language = language
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
        option_check = true
        @program_selection = :crack
      elsif (user_option == "4")
        Message.end_program(language)
        exit
      end
    end
  end

  def select_file
    file_check = false
    while file_check == false
      Message.select_file(language)
      file_path = './files/' + gets.chomp
      if File.exist?(file_path)
        file_check = true
      else
        Message.file_error(language)
      end
    end
    File.read(file_path)
  end

  def get_key_input
    Message.enter_key(language)
    gets.chomp
  end

  def get_date_input
    Message.enter_date(language)
    gets.chomp
  end

  def select_file_destination
    file_check = false
    while file_check == false
      Message.select_file_destination(language)
      file_path = './files/' + gets.chomp
      if !File.exist?(file_path)
        file_check = true
        @filepath = file_path
      else
        Message.new_file_error(language)
      end
    end
    file_path
  end
end
