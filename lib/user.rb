class User
  attr_reader :language, :program_selection, :file, :new_filepath

  def initialize(language)
    @language = language
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

  def select_file_for_decryption
    file_check = false
    while file_check == false
      Message.select_decrypt_file(language)
      file_path = './data/' + gets.chomp
      if File.exist?(file_path)
        file_check = true
        @file = File.read(file_path)
      else
        Message.file_error(language)
      end
    end
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
      file_path = './data/' + gets.chomp
      if !File.exist?(file_path)
        file_check = true
        @new_filepath = file_path
      else
        Message.new_file_error(language)
      end
    end
  end

end
