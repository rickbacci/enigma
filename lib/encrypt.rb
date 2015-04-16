require 'pry'

require './lib/offset'
require './lib/reader'
require './lib/writer'
require './lib/encryption_key'
require './lib/message_date'
require './lib/rotator'

class Encrypt

  attr_reader :message_filename, :encrypted_filename

  def initialize(message_filename, encrypted_filename)
    @message_filename = message_filename || 'message.txt'
    @encrypted_filename = encrypted_filename || 'encrypted.txt'

    @encryption_key = generate_key
    @date = generate_date
  end

  def encrypt
    message_text   = get_file(message_filename)

    key_rotations  = key_rotations(@encryption_key)
    date_offset    = date_offset(@date)

    total_offset   = calculate_total_offset(date_offset, key_rotations)

    encrypted_text = encrypt_text(message_text, total_offset)

    write_file(encrypted_text, encrypted_filename)

    result
  end

  def generate_key
    EncryptionKey.generate_key
  end

  def generate_date
    MessageDate.generate_date
  end

  def get_file(message_filename)
    Reader.read_file(message_filename)
  end

  def key_rotations(encryption_key)
    EncryptionKey.calculate_rotations(encryption_key)
  end

  def date_offset(date)
    MessageDate.calculate_offset(date)
  end

  def encrypt_text(message_text, total_offset)
    Rotator.encrypt(message_text, total_offset)
  end

  def calculate_total_offset(date_offset, key_rotations)
    Offset.total_offset(date_offset, key_rotations)
  end

  def write_file(encrypted_text, encrypted_filename)
    Writer.check_file(encrypted_text, encrypted_filename)
  end

  def result
    puts `clear && printf '\e[3J'` # clear terminal
    puts "Created #{encrypted_filename} with the key #{@encryption_key} and the date #{@date}"
  end

end

if __FILE__ == $0
  message = Encrypt.new(ARGV[0], ARGV[1])
  message.encrypt
end







