

class Reader

  def self.read_file(message_file)
    File.read(message_file).strip
  end
end

#p Reader.read_file('message.txt')
