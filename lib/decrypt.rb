require './lib/offset'
require './lib/reader'
require './lib/writer'
require './lib/encryption_key'
require './lib/message_date'
require './lib/rotator'

require 'pry'

  class Decrypt
    attr_reader :key, :date
    def initialize(input_file='', output_file='', key, date)
      @input_file = input_file
      @output_file = output_file
      @key = key
      @date = date
    end

    def decrypt(encrypted_text)
      total_offset = calculate_total_offset(date_offset(date), key_rotations(key))
      decrypt_text(encrypted_text, total_offset)
    end

    def key_rotations(key)
      EncryptionKey.calculate_rotations(key)
    end

    def date_offset(date)
      MessageDate.calculate_offset(date)
    end

    def calculate_total_offset(date_offset, key_rotations)
      Offset.total_offset(date_offset, key_rotations)
    end

    def decrypt_text(encrypted_text, total_offset)
      Rotator.decrypt(encrypted_text, total_offset)
    end

    def result(output_file)
      "Created #{output_file} with the key #{key} and the date #{date}"
    end
  end

if __FILE__ == $0
  input_file  = ARGV[0]
  output_file = ARGV[1]
  key         = ARGV[2]
  date        = ARGV[3]

  encrypted_text = Reader.read_file(input_file)

  message = Decrypt.new(key, date)
  decrypted_text = message.decrypt(encrypted_text)

  Writer.check_file(output_file, decrypted_text)
  puts message.result(output_file)
end


