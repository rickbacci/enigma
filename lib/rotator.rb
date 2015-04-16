
class Rotator

  CHARACTER_MAP = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']


  def self.encrypt(message, total_offset)
    message.chars.map.with_index do |char, index|
      current_rotation = index % 4
      char_index = CHARACTER_MAP.index(char)

      CHARACTER_MAP[(total_offset[current_rotation] + char_index) % CHARACTER_MAP.length]
    end.join
  end

  def self.decrypt(message, total_offset)
    message.chars.map.with_index do |char, index|
      current_rotation = index % 4
      char_index = CHARACTER_MAP.index(char)

      CHARACTER_MAP[char_index - (total_offset[current_rotation]) % CHARACTER_MAP.length]
    end.join
  end
end
