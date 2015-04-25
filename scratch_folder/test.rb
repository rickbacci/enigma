require 'pry'

 character_map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
#
#
# message = 'help..end..'




message0 = 'xxxxx..end..' #working
message1 = 'xxxxxx..end..' # mod 1
message2 = 'xxxxxxx..end..' # mod 2
message3 = 'xxxxxxxx..end..' # mod 3



p mod0 = message0.length % 4
p mod1 = message1.length % 4
p mod2 = message2.length % 4
p mod3 = message3.length % 4

msgs = [message0, message1, message2, message3]

#for each character in message
#  figure out which rotation we're curerntly on
#  using char_map, rotate the character
#return the whole message

rotations = [1, 1, 1, 1]

msgs = msgs.map do |message|
  mod = -(message.length % 4) -1
  message.chars.map.with_index do |char, index|
    current_rotation = index % 4
    char_index = character_map.index(char)
    character_map[(rotations[current_rotation] + char_index) % character_map.length]
  end.join
  message[(mod - 3)..mod]
end

p msgs # encrypted

p 'text to look at'
######p message = message[-7..-4] # skip the remainder (3) text at last whole 4 digit group








#
#
# message = message.chars.map.with_index do |char, index|
#   current_rotation = index % 4
#   char_index = character_map.index(char)
#   character_map[char_index - (rotations[current_rotation]) % character_map.length]
# end.join
#
# p message # decrypted
#
#

#
# character_map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
#
# # cracking possibilities based on message size ( message % 4 )
#
# # ..end..
#
# #  'nd..'
# #  'end.'
# #  '.end'
# #  '..en'
#
# puts '12345678'.length % 4  # = 0 search for 'en..'
# puts '12345'.length % 4     # = 1 search for 'end.'
# puts '123456'.length % 4    # = 2 search for '.end'
# puts '1234567'.length % 4   # = 3 search for '..en'
#
#
#
# message0 = 'xxxxx..end..' # working
# message1 = 'xxxxxx..end..' # mod 1
# message2 = 'xxxxxxx..end..' # mod 2
# message3 = 'xxxxxxxx..end..' # mod 3
#
# #puts "suspected msg ending: #{message}"
#
# rotations = [1, 1, 1, 1]   ###### this is the encryption algorithm  ##should be 'oe,,'
#
# message =  message.chars.map.with_index do |char, index|
#   current_rotation = index % 4
#   char_index = character_map.index(char)
#   character_map[(rotations[current_rotation] + char_index) % character_map.length]
# end.join
#
# #p message    ## encrypted suspected 'end of msg'
# puts "encrypted suspected msg0 ending: #{message0}"
# puts "encrypted suspected msg1 ending: #{message1}"
# puts "encrypted suspected msg2 ending: #{message2}"
# puts "encrypted suspected msg3 ending: #{message3}"
#
#
# def end_msg_variants
#   {
#     0 => 'nd..',
#     1 => 'end.',
#     2 => '.end',
#     3 => '..en'
#   }
# end


suspected_chars = end_msg_variants[message.size % 4] ## 'nd..'
suspected_offset = []
message.chars.zip(suspected_chars.chars) do |char, susp|
  char_index = character_map.index(char)
  susp_index = character_map.index(susp)
  suspected_offset << character_map.index(character_map[(char_index - susp_index) % character_map.length])
end

puts "suspected offset: #{suspected_offset}"
#
# suspected_chars = end_msg_variants[message.size % 4] ## 'nd..'
# suspected_offset = []
# message.chars.zip(suspected_chars.chars) do |char, susp|
#   char_index = character_map.index(char)
#   susp_index = character_map.index(susp)
#   suspected_offset << character_map.index(character_map[(char_index - susp_index) % character_map.length])
# end
#
# puts "suspected offset: #{suspected_offset}"
#
# suspected_chars = end_msg_variants[message.size % 4] ## 'nd..'
# suspected_offset = []
# message.chars.zip(suspected_chars.chars) do |char, susp|
#   char_index = character_map.index(char)
#   susp_index = character_map.index(susp)
#   suspected_offset << character_map.index(character_map[(char_index - susp_index) % character_map.length])
# end
# puts "suspected offset: #{suspected_offset}"
#
# suspected_chars = end_msg_variants[message.size % 4] ## 'nd..'
# suspected_offset = []
# message.chars.zip(suspected_chars.chars) do |char, susp|
#   char_index = character_map.index(char)
#   susp_index = character_map.index(susp)
#   suspected_offset << character_map.index(character_map[(char_index - susp_index) % character_map.length])
# end
# puts "suspected offset: #{suspected_offset}"
