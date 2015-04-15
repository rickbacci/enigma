character_map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']


message = 'help asdf how asdf  fjsdfkafslsdasdf lkfa sdf'

# for each character in message
#   figure out which rotation we're curerntly on
#   using char_map, rotate the character
# return the whole message

rotations = [40, 40, 40, 40]

t =  message.chars.map.with_index do |char, index|
   current_rotation = index % 4
   char_index = character_map.index(char)
    character_map[(rotations[current_rotation] + char_index) % character_map.length]
end.join

p t
