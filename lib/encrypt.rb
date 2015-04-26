require 'pry'

require './lib/offset'
require './lib/reader'
require './lib/writer'
require './lib/encryption_key'
require './lib/message_date'
require './lib/rotator'

class Encrypt

  attr_reader :date, :encryption_key

  def initialize
    @date = generate_date
    @encryption_key = generate_key
  end

  def encrypt(message_text)
    key_rotations  = key_rotations(encryption_key)
    date_offset    = date_offset(date)

    total_offset   = calculate_total_offset(date_offset, key_rotations)

    encrypt_text(message_text, total_offset)
  end

  def generate_key
    EncryptionKey.generate_key
  end

  def generate_date
    MessageDate.generate_date
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

  def result(output_file)
    puts `clear && printf '\e[3J'` # clear terminal
    "Created #{output_file} with the key #{encryption_key} and the date #{date}"
  end
end

if __FILE__ == $0
  input_file  = ARGV[0]
  output_file = ARGV[1]

  message_text = Reader.read_file(input_file)

  message = Encrypt.new

  encrypted_text = message.encrypt(message_text)

  Writer.write_file(output_file, encrypted_text)
  puts message.result(output_file)
end







