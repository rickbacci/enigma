require 'Date'
require './lib/key'
require './lib/date_offset'
require './lib/reader'


class Encrypt
  attr_reader :message_file, :encrypted_file, :character_map
  attr_reader :encryption_key, :date_offset, :msg_text

  def initialize(message_file, encrypted_file)

    #@character_map = 'abcdefghijklmnopqrstuvwxyz0123456789 .,'.split('')
    @character_map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']

    @message_file = message_file || 'message.txt'
    @encrypted_file = encrypted_file || 'encrypted.txt'

    @msg_text = Reader.read_file(@message_file)

    @encryption_key = Key.generate

    today = Date.today.strftime('%d%m%y')
    @date_offset = DateOffset.generate(today)

    @total_offset = total_offset(@date_offset, @encryption_key)

  end

  def total_offset(date_offset, key)
    date_offset.zip(key).map { |date, key| (date + key) % 39 }
  end

  def sliced_msg
    @msg_text.scan(/.{4}/)
  end

  def rotate(total_offset)
    sliced_msg.zip(total_offset)
  end



end

msg = Encrypt.new(ARGV[0], ARGV[1])



puts "encryption key: #{msg.encryption_key}"
puts "   date offset: #{msg.date_offset}"
puts "  total offset: #{msg.total_offset(msg.encryption_key, msg.date_offset)}"


@total_offset = msg.total_offset(msg.encryption_key, msg.date_offset)


p msg.message_file
p msg.encrypted_file
puts
p msg.msg_text

sliced = msg.sliced_msg


@character_map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']

sl = sliced.map do |slice|
      p slice.chars.map { |val| @character_map.index(val) }#.zip.(@total_offset)
        #map { |val| @character_map.index(val) }.map { |v| p v }
     end
puts

p 'sl zip total'
p sl#.zip(@total_offset)
p 'total zip sl'
p @total_offset.zip(sl)
#p msg.rotate(@total_offset)


# sl = sliced.map do |slice|
#   p slice.chars.map { |val| @character_map.index(val) }
# end
