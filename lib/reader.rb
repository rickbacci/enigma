

class Reader

  def self.read_file(message_file)
    message_file ||= 'message.txt'
    reader = File.open(message_file, 'r')
    reader.read
  end
end
