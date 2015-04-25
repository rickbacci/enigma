class Writer

  def self.check_file(filename, text)
    if File.exist?(filename)
      warning(filename)
      input = $stdin.gets.chomp
      write_file(filename, text) if input == 'yes'
    else
      write_file(filename, text)
    end
  end

  def self.write_file(filename, text)
    File.write(filename, text)
  end

  def self.warning(filename)
    puts `clear && printf '\e[3J'` # clear terminal
    puts "The file #{filename} already exists on your system! Do you want to overwrite the existing file, or cancel?\n\n"
    puts "Type: 'yes' to overwrite, or [return] to cancel\n\n"
  end
end

