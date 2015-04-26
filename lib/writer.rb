class Writer

  def self.check_file(filename, text, test=false)
    if File.exist?(filename)# && !test
      warning(filename, test)
      if test
        input = 'yes'.chomp
      else
        input = $stdin.gets.chomp
      end
      write_file(filename, text) if input == 'yes'
    else
      write_file(filename, text)
    end
  end

  def self.write_file(filename, text)
    File.write(filename, text)
  end

  def self.warning(filename, test)
    unless test
      puts "\n\nThe file #{filename} already exists on your system! Do you want to overwrite the existing file, or cancel?\n\n"
      puts "Type: 'yes' to overwrite, or [return] to cancel\n\n"
    end
  end
end

