require 'pry'

require './lib/reader'
require './lib/writer'
require './lib/rotator'


class CrackMessage
  attr_reader :character_map

  def initialize
    @character_map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
  end


  def crack_total_offset(message)
    target_characters(message).chars.zip(suspected_characters(message)).map do |char, susp|
      index_difference(char, susp)
    end
  end

  def result(output_file, total_offset)
    "\n\nCreated #{output_file} with total offset of: #{total_offset}\n\n"
  end

   private

  def target_characters(message)
    message[select_range(message_offset(message))]
  end

  def character_map_index(character)
    character_map.index(character)
  end

  def end_msg_possibilities
    { 0 => 'nd..', 1 => 'end.', 2 => '.end', 3 => '..en' }
  end

  def message_offset(message)
    message.size % 4 == 0 ? 0 : -1 * (message.size % 4)
  end

  def select_range(message_offset)
    (message_offset - 4)..(message_offset - 1)
  end

  def suspected_characters(message)
    end_msg_possibilities[message.size % 4].chars
  end

  def index_difference(char, susp)
    (character_map_index(char) - character_map_index(susp)) % 39
  end
end


if __FILE__ == $0
  input_file  = ARGV[0]
  output_file = ARGV[1]

  encrypted_text = Reader.read_file(input_file)

  message = CrackMessage.new
  total_offset = message.crack_total_offset(encrypted_text)
  puts
  puts cracked_text = Rotator.decrypt(encrypted_text, total_offset)

  Writer.check_file(output_file, cracked_text)
  puts message.result(output_file, total_offset)
end
