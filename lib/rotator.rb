
class Rotator
  attr_reader :character_map

  def initialize
    @character_map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
  end

  def rotate(type, message, total_offset)
    if type == :encrypt
      return forward(message, total_offset)
    elsif type == :decrypt
      return backward(message, total_offset)
    else
      # crack
    end
  end

  def forward(message, total_offset)
    message.chars.map.with_index do |char, index|
      current_rotation = index % 4
      char_index = character_map.index(char)
      character_map[(total_offset[current_rotation] + char_index) % @character_map.length]
    end.join
  end

  def backward(message, total_offset)
    message.chars.map.with_index do |char, index|
      current_rotation = index % 4
      char_index = character_map.index(char)
      character_map[char_index - (total_offset[current_rotation]) % @character_map.length]
    end.join
  end
end
