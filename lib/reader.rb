

class Reader

  def self.read_file(message_file)
    message_file ||= 'message.txt'

    file = File.open(message_file, 'r')
    contents = file.read
    file.rewind
    file.close
    return format_contents(contents)
  end

  def self.format_contents(message)
    message.gsub("\n", '').downcase
  end
end
