class Writer

  def self.write_file(encrypted_text, encrypted_filename)
    encrypted_filename ||= 'excrypted.txt'
    File.open(encrypted_filename, 'w') do |file|

      if File.exist?(encrypted_filename)
        puts `clear && printf '\e[3J'` # clear terminal
        puts "The file #{encrypted_filename} already exists on your system! Do you want to overwrite the existing file, or cancel?\n\n"
        puts "Type: 'yes' to overwrite, or [return] to cancel"

        input = gets.chomp

        if input == 'yes'
          file.write(encrypted_text)
        end
      else
        file.write(encrypted_text)
      end
    end
  end
end
