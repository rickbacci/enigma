require 'pry'

require './lib/offset'
require './lib/reader'
require './lib/writer'
require './lib/encryption_key'
require './lib/message_date'
require './lib/rotator'


  class Decrypt
    attr_reader :key, :date, :encrypted_filename, :decrypted_filename

    def initialize(encrypted_filename, decrypted_filename, key, date)

      @encrypted_filename = encrypted_filename || 'encrypted.txt'
      @decrypted_filename = decrypted_filename || 'encrypted.txt'
      @key = key
      @date = date

    end

    def decrypt

      key_rotations = key_rotations(key)
      date_offset = date_offset(date)

      total_offset = calculate_total_offset(date_offset, key_rotations)


      encrypted_text = get_file(encrypted_filename)

      decrypted_text = decrypt_text(encrypted_text, total_offset)

      write_file(decrypted_text, decrypted_filename)
      result
    end

    def get_file(encrypted_filename)
      Reader.read_file(encrypted_filename)
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

    def write_file(decrypted_text, decrypted_filename)
      Writer.check_file(decrypted_text, decrypted_filename)
    end

    def result
      puts "Created #{decrypted_filename} with the key #{key} and the date #{date}"
    end
  end

if __FILE__ == $0
  msg = Decrypt.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
  msg.decrypt
end


