class Message

  def self.home_screen
    puts '  ___ _  _ ___ ___ __  __   _   '
    puts ' | __| \| |_ _/ __|  \/  | /_\  '
    puts ' | _|| .` || | (_ | |\/| |/ _ \ '
    puts ' |___|_|\_|___\___|_|  |_/_/ \_\ '
    puts "\nPlease type 'en' for English prompts or 'es' for Spanish."
    puts "Por favor escribe 'en' para texto en Ingles o 'es' en Espanol."
    print "> "
  end

  def self.begin_program(language)
    if language == "es"
      puts "Bienvenidos a Enigma, un programa de cifrado/descifrado de archivos.\n"
      puts "Coloque los archivos textos en la carpeta de \'files\'."
    else
      puts "Welcome to Enigma, a file encryption/decryption program.\n"
      puts "Please place text files in this directory's \'files\' folder."
    end
  end

  def self.select_program(language)
    print "\n"
    if language == "es"
      puts "Entras 1 o 2 para continuar:"
      puts "1. Encriptar Archivo"
      puts "2. Desencriptar Archivo"
      puts "3. Cerrar la Programa"
    else
      puts "Enter 1 or 2 to continue:"
      puts "1. Encrypt File"
      puts "2. Decrypt File"
      puts "3. Close Program"
    end
    print "> "
  end

  def self.select_file(language)
    if language == "es"
      puts "Por favor escribes la nombre de archivo a cifrar/descifrar"
      puts "Ejemplo: shakespeare.txt"
    else
      puts "Please enter the name of the text file to be encrypted/decrypted."
      puts "Example: shakespeare.txt"
    end
  end

  def self.file_error(language)
    if language == "es"
      puts "Lo siento, ese archivo no existe."
    else
      puts "Sorry, that file does not exist. Please try again."
    end
  end

  def self.new_file_error(language)
    if language == "es"
      puts "Lo siento, ese archivo ya existe."
    else
      puts "Sorry, that file already exists. Please try again."
    end
  end

  def self.enter_key(language)
    if language == "es"
      puts "Por favor escribes el clave de cinco dígitos utilizada para cifrar."
    else
      puts "Please enter the 5 digit key used for encryption."
    end
    print "> "
  end

  def self.enter_date(language)
    if language == "es"
      puts "Por favor escribes la fecha utilizada para cifrar."
    else
      puts "Please enter the date used for encryption."
    end
    print "> "
  end

  def self.select_file_destination(language)
    if language == "es"
      puts "Qué nombre quieres para el neuvo archivo?"
      puts "Ejemplo: archivo_neuvo.txt"
    else
      puts "What name do you want the new file to be called?"
      puts "Example: new_file.txt"
    end
  end

  def self.success(language, file_path, key, date)
    if language == "es"
      puts "Creado \'#{file_path}\' con la clave #{key} y la fecha #{date}."
    else
      puts "Created \'#{file_path}\' with the key #{key} and date #{date}."
    end
  end

  def self.end_program(language)
    if language == "es"
      puts "Adios! Gracias para usar Enigma."
    else
      puts "Goodbye! Thanks for using Enigma."
    end
  end
end
