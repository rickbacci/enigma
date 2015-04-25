require 'pry'

character_map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']



########## encryption -----------------------------------------------



#message = '..end..'

# rotations = [1, 1, 1, 1]   ###### this is the encryption algorithm
#
# message =  message.chars.map.with_index do |char, index|
#   current_rotation = index % 4
#   char_index = character_map.index(char)
#   character_map[(rotations[current_rotation] + char_index) % character_map.length]
# end.join
#
# #p message    ## encrypted suspected 'end of msg'



########## decryption -----------------------------------------------



# message = message.chars.map.with_index do |char, index|
#   current_rotation = index % 4
#   char_index = character_map.index(char)
#   character_map[char_index - (rotations[current_rotation]) % character_map.length]
# end.join
#
# p message # decrypted



########## crack ----------------------------------------------------



# 'xxxx xxxx xxxx x..e nd..'  # % 4 == 0 # nd.. for mod 0
# 'xxxx xxxx xxxx ..en d..'   # % 4 == 3 # ..en for mod 3
# 'xxxx xxxx xxx. .end ..'    # % 4 == 2 # .end for mod 2
# 'xxxx xxxx xx.. end. .'     # % 4 == 1 # end. for mod 1
#                 ^^^^
# last complete group of 4 digits


message0 = 'xxxxx..end..' # mod 0
message1 = 'xxxxxx..end..' # mod 1
message2 = 'xxxxxxx..end..' # mod 2
message3 = 'xxxxxxxx..end..' # mod 3
message4 = 'hello this is ricky. i have attempted to make a crack algorithm that does not use brute force. testing it now..end..'

# p mod0 = message0.length % 4
# p mod1 = message1.length % 4
# p mod2 = message2.length % 4
# p mod3 = message3.length % 4

msgs = [message0, message1, message2, message3, message4]

#for each character in message
#  figure out which rotation we're curerntly on
#  using char_map, rotate the character
#return the whole message

#rotations = [71, 11, 91, 6] # % 39 returns rotations below
rotations = [32, 11, 13, 6] # same result returned


#p "\ntext to look at"
#p message = message[-7..-4] # need last compete group of 4 digits

#messages = [message0, message1, message2, message3]
### need to subtract mod off the end before you calculate

# def end_msg_variants
#   {
#     0 => 'nd..',
#     1 => 'end.',
#     2 => '.end',
#     3 => '..en'
#   }
# end


# suspected_chars = end_msg_variants[message.size % 4]
# suspected_offset = []
# message.chars.zip(suspected_chars.chars) do |char, susp|
#   char_index = character_map.index(char)
#   susp_index = character_map.index(susp)
#   suspected_offset << character_map.index(character_map[(char_index - susp_index) % character_map.length])
# end
# puts "suspected offset: #{suspected_offset}"
