require 'pry'

require './lib/offset'
require './lib/reader'
require './lib/writer'    ################# does not work!!!!!
require './lib/encryption_key'
require './lib/message_date'
require './lib/rotator'

class Encrypt
  attr_reader :message_filename, :encrypted_filename

  def initialize(message_filename, encrypted_filename)
   @message_filename = message_filename# || 'message.txt'
   @encrypted_filename = encrypted_filename# || 'encrypted.txt'
  end

  def convert

    @encryption_key = EncryptionKey.generate_key
    key_rotations = EncryptionKey.calculate_rotations(@encryption_key)

    @date = MessageDate.generate_date

    date_offset = MessageDate.calculate_offset(@date)

    message_text = Reader.read_file(message_filename)

    total_offset = Offset.total_offset(date_offset, key_rotations)

    rotate = Rotator.new

    message_text = rotate.format_message(message_text)

    encrypted_text = rotate.rotate(:encrypt, message_text, total_offset)

    Writer.check_file(encrypted_text, encrypted_filename)
  end

  def result
    puts "Created #{@encrypted_filename} with the key #{@encryption_key} and the date #{@date}"
  end

end

message = Encrypt.new(ARGV[0], ARGV[1])
message.convert
message.result









