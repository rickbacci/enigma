require './lib/offset'
require './lib/reader'
require './lib/encryption_key'
require './lib/message_date'
require './lib/rotater'

class Encrypt
  attr_reader :message_file, :encrypted_file

  def initialize(message_file, encrypted_file)
   @message_file = message_file || 'message.txt'
   @encrypted_file = encrypted_file || 'encrypted.txt'
  end



  def result
    puts "Created #{@encrypted_file} with the key #{@encryption_key} and the date #{@date}"
  end


end




# the encrypt class will receive an msg and call the date class to get the date string and offset.
# the cncrypt class will generate a key with an offset.

#Created 'encrypted.txt' with the key 82648 and date 030415


# Encryptor receives the names of 2 text files...first is the msg...2nd is the file to be written
message = Encrypt.new(ARGV[0], ARGV[1])

p 'this is the message file name'
p message_file = message.message_file
puts

p 'this is the key and key rotation'
p key = EncryptionKey.generate_key
p key_rotations = EncryptionKey.calculate_rotations
puts

p 'this is the date and date offset'
p date = MessageDate.generate_date
p date_offset = MessageDate.calculate_offset(date)
puts

p 'this is the text in the message.txt file'
p message_text = Reader.read_file(message_file)



total_offset = Offset.total_offset(MessageDate.calculate_offset(date), EncryptionKey.calculate_rotations)
puts
p 'total offset'
p total_offset



rotate = Rotater.new
p rotate.rotate(message_text, total_offset)









