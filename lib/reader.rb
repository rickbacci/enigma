

class Reader

  def self.read_file(message_file)
    message_file || 'message.txt'
    File.read(message_file)
  end
end
