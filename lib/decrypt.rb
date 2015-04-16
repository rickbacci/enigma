require 'pry'

require './lib/offset'
require './lib/reader'
require './lib/writer'
require './lib/encryption_key'
require './lib/message_date'
require './lib/rotator'


  class Decrypt
    attr_reader :key, :date, :encrypted_message, :decrypted_message

    def initialize(encrypted_filename, decrypted_filename, key, date)
      @encrypted_filename = encrypted_filename
      @decrypted_filename = decrypted_filename
      @key = key
      @date = date
    end

    def convert
      key_rotations = EncryptionKey.calculate_rotations(key)
      date_offset = MessageDate.calculate_offset(date)
      total_offset = Offset.total_offset(date_offset, key_rotations)

      encrypted_text = Reader.read_file(@encrypted_filename)


      rotate = Rotator.new

      encrypted_text = rotate.format_message(encrypted_text)

      decrypted_text = rotate.rotate(:decrypt, encrypted_text, total_offset)


      Writer.check_file(decrypted_text, @decrypted_filename)

    end
  end



msg = Decrypt.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
msg.convert


# ## encrypted.txt decrypted.txt 11111 150415
#
#
# ## we need to get the key rotations
# # k = msg.key
# # p key_rotations = EncryptionKey.calculate_rotations(k)
#
#
# ## we need to get the date_offset
# date = msg.date
# date_offset = MessageDate.calculate_offset(date)
#
# ## we need to get the total offset
# total_offset = Offset.total_offset(date_offset, key_rotations)
#
#
#
# ## we need to send the encrypted msg to the rotator with the total offset
# ## character map either needs to be reversed or count backward to decrypt
# rotate = Rotator.new
# decrypted_text = rotate.format_message(msg.encrypted_message)
# decrypted_text = rotate.rotate(:decrypt, decrypted_text, total_offset)
#
#
# Writer.check_file(decrypted_text, msg.decrypted_message)
