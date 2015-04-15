
class Rotater
  attr_reader :character_map

  def initialize
    @character_map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
  end

  def rotate(message, total_offset)
    message = message.strip!.downcase!
    p 'msg in rotate method'
    p message.strip

    message.chars.map.with_index do |char, index|
      current_rotation = index % 4
      char_index = character_map.index(char)
      character_map[(total_offset[current_rotation] + char_index) % character_map.length]
    end.join
  end
end
