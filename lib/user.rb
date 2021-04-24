class User
  attr_reader :language, :program_selection, :file

  def initialize(language)
    @language = language
    @program_selection = nil
  end

  def welcome_user
    if @language == "es"
      Message.begin_program_es
    else
      Message.begin_program_en
    end
  end

  def choose_option
    option_check = false
    print("\n")

    while option_check == false do
      if @language == "es"
        Message.select_program_es
        user_option = gets.chomp

        if (user_option == "3")
          Message.end_program_es
          exit
        end
      else
        Message.select_program_en
        user_option = gets.chomp

        if (user_option == "3")
          Message.end_program_en
          exit
        end
      end

      if (user_option == "1")
        option_check = true
        @program_selection = :encrypt
      elsif (user_option == "2")
        option_check = true
        @program_selection = :decrypt
      end
    end
  end

  def select_file_for_encryption
    file_check = false

    while file_check == false
      if @language == 'es'
        Message.select_encrypt_file_es
        file_path = './data/' + gets.chomp
        if File.exist?(file_path)
          @file = File.open(file_path, "r")
          file_check = true
        else
          Message.file_error_es
        end
      else
        Message.select_encrypt_file_en
        file_path = './data/' + gets.chomp
        if File.exist?(file_path)
          @file = File.open(file_path, "r")
          file_check = true
        else
          Message.file_error_en
        end
      end
    end
  end


end
