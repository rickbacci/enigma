require 'pry'

class CrackMessage
  attr_reader :character_map

  def initialize
    @character_map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
  end

  def crack_message(message)
    target_characters(message).chars.zip(suspected_characters(message)).map do |char, susp|
      index_difference(char, susp)
    end
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
    message.length % 4 == 0 ? 0 : -1 * (message.size % 4)
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
