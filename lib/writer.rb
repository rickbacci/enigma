class Writer

  def self.check_file(encrypted_text, encrypted_filename)

    # if File.exist?(encrypted_filename)
    #   warning(encrypted_filename)
    #
    #   input = $stdin.gets.chomp
    #
    #   write_file(encrypted_filename, encrypted_text) if input == 'yes'
    # else
    #   write_file(encrypted_filename, encrypted_text)
    # end
  end

  def self.write_file(encrypted_filename, encrypted_text)

    File.open(encrypted_filename, "w") do |file|
      file.write(encrypted_text)
    end
  end

  def self.warning(encrypted_filename)

    puts `clear && printf '\e[3J'` # clear terminal
    puts "The file #{encrypted_filename} already exists on your system! Do you want to overwrite the existing file, or cancel?\n\n"
    puts "Type: 'yes' to overwrite, or [return] to cancel\n\n"
  end
end

