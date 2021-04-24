class Message

  def self.home_screen
    puts '    ___                       '
    puts '   / __|__ _ ___ ___ __ _ _ _ '
    puts "  | (__/ _` / -_|_-</ _` | '_|"
    puts '   \___\__,_\___/__/\__,_|_|  '
    puts '    ___ ___ ___ _  _ ___ ___ '
    puts '   / __|_ _| _ \ || | __| _ \ '
    puts '  | (__ | ||  _/ __ | _||   /'
    puts '   \___|___|_| |_||_|___|_|_\ '
  end

  def self.select_language
    puts "\nPlease type 'en' for English prompts or 'es' for Spanish."
    puts "Por favor escribe 'en' para texto en Ingles o 'es' en Espanol."
    print "> "
  end

  def self.begin_program_en
    puts "Welcome to CaesarCipher.\n"
    puts "Please place text files in this directory's \'files\' folder."
  end

  def self.begin_program_es
    puts "Bienvenidos a CaesarCipher.\n"
    puts "Coloque los archivos textos en la carpeta de \'files\'."
  end

  def self.select_program_en
    puts "Enter 1 or 2 to continue:"
    puts "1. Encrypt File"
    puts "2. Decrypt File"
    puts "3. Close Program"
    print "> "
  end

  def self.select_program_es
    puts "Entras 1 o 2 para continuar:"
    puts "1. Encriptar Archivo"
    puts "2. Desencriptar Archivo"
    puts "3. Cerrar la Programa"
    print "> "
  end

  def self.select_encrypt_file_en
    puts "Please enter the name of the text file to be encrypted."
    puts "Example: unsecured_data.txt"
  end

  def self.select_encrypt_file_es
    puts "Por favor escribar la nombre de archivo a cifrar."
    puts "Ejemplo: datos_no_seguros.txt"
  end

  def self.select_decrypt_file_en
    puts "Please enter the name of the text file to be decrypted."
    puts "Example: secured_data.txt"
  end

  def self.select_decrypt_file_es
    puts "Por favor escribar la nombre de archivo a descifrar."
    puts "Ejemplo: datos_seguros.txt"
  end

  def self.file_error_en
    puts "Sorry, that file does not exist. Please try again."
  end

  def self.file_error_es
    puts "Lo siento, ese archivo no existe."
  end

  def self.enter_key_en
    puts "Please enter the 5 digit key used for encryption."
    print "> "
  end

  def self.enter_key_es
    puts "Por favor escribar el clave de cinco dígitos utilizada para cifrar."
    print "> "
  end

  def self.enter_date_en
    puts "Please enter the date used for encryption."
    puts "Example: 1998-10-02"
    print "> "
  end

  def self.enter_date_es
    puts "Por favor escribar la fecha utilizada para cifrar."
    puts "Ejemplo: 2020-10-02"
    print "> "
  end

  def self.successful_encryption_en
    puts "Your file was successfully encrypted."
    puts "Please write down the following key and date to decrypt later:\n"
  end

  def self.successful_encryption_es
    puts "Cifrado de archivo exitoso."
    puts "Recuerde la siguiente clave y fecha para descifrar:\n"
  end

  def self.successful_decryption_en
    puts "Your file was successfully decrypted."
  end

  def self.successful_decryption_es
    puts "Descifrado de archivo exitoso."
  end

  def self.end_program_en
    puts "Goodbye! Thanks for using CaesarCipher."
  end

  def self.end_program_es
    puts "Adios! Gracias para usar CaesarCipher."
  end
end
