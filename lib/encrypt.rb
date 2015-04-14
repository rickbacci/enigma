






class Encrypt
  attr_reader :character_map, :message_file, :encrypted_file

  def initialize(message_file, encrypted_file='encrypted.txt')
    @character_map = 'abcdefghijklmnopqrstuvwxyz0123456789 .,'.split('')

    @message_file = message_file || 'message.txt'
    @encrypted_file = encrypted_file || 'encrypted.txt'
    @msg_text = File.read(@message_file).strip
    @excrypted_text = ''
  end

  def msg_text
    @msg_text
  end
end

msg = Encrypt.new(ARGV[0], ARGV[1])


# p msg.message_file
# p msg.encrypted_file
# p msg.msg_text
