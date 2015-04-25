

class Reader

  def self.read_file(message_file)
    format_contents(File.read(message_file))
  end

  def self.format_contents(message)
    message.gsub("\n", '').downcase
  end
end
