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
      @decrypted_filename = decrypted_filename || 'decrypted.txt'
      @key = key
      @date = date

    end

    def convert

      key_rotations = EncryptionKey.calculate_rotations(key)
      date_offset = MessageDate.calculate_offset(date)

      total_offset = Offset.total_offset(date_offset, key_rotations)

      rotate = Rotator.new

      encrypted_text = Reader.read_file(encrypted_filename)
      encrypted_text = rotate.format_message(encrypted_text)

      decrypted_text = rotate.rotate(:decrypt, encrypted_text, total_offset)

      Writer.check_file(decrypted_text, decrypted_filename)

    end

    def result
      puts "Created #{decrypted_filename} with the key #{key} and the date #{date}"
    end
  end

msg = Decrypt.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])

msg.convert
msg.result

