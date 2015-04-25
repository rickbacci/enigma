require 'pry'

class CrackMessage
  attr_reader :character_map

  def initialize
    @character_map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
  end

  def crack_message(message)
    message.chars.zip(suspected_characters(message)).map do |char, susp|
      index_difference(char, susp)
    end
  end

  def target_characters(message)
    message[select_range(message_offset(message))]
  end

   private

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
    (character_map_index(char) - character_map_index(susp)).abs
  end
end






































__END__




    #message = 'xxxxxxxxxxxxx..end..'  #% 4 == 0 # nd.. for mod 0    yyyyyyyyyyyyy,,foe,,
    #message = 'xxxxxxxxxxxx..end..'   #% 4 == 3 # ..en for mod 3    yyyyyyyyyyyy,,fo
    #message = 'xxxxxxxxxxx..end..'    #% 4 == 2 # .end for mod 2     yyyyyyyyyyy,,foe
    #message = 'xxxxxxxxxx..end..'     #% 4 == 1 # end. for mod 1   yyyyyyyyyy,,foe,         yz01yz01yzbcfpgc, 1234

#messages = [message0, message1, message2, message3]
### need to subtract mod off the end before you calculate
                                                                                              # zbcf
character_map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']

message = 'x..e'
 remainder = message.size.to_i % 4
#message = message.chop
p message.size
x = ''
#p x = 'yz01yz01yzbcfpgc'[-7..-4]

  message = message.chars.map.with_index do |char, index|
    rotations = [1, 2, 3, 4]

    current_rotation = index % 4
    char_index = character_map.index(char)

  character_map[(rotations[current_rotation] + char_index) % character_map.length]
  end.join

puts message
           ## encrypted suspected 'end of msg'
# puts "encrypted suspected msg0 ending: #{message0}"
# puts "encrypted suspected msg1 ending: #{message1}"
# puts "encrypted suspected msg2 ending: #{message2}"
# puts "encrypted suspected msg3 ending: #{message3}"



# ['nd..', 'end.', '.end', '..en']
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
#
#
# suspected_chars = end_msg_variants[message.size % 4]
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








           #message = 'xxxx xxxx xxxx  x..e    nd..'  #% 4 == 0 # nd.. for mod 0    yyyyyyyyyyyyy,,foe,,
           #message = 'xxxx xxxx xxxx  ..en   d..'   #% 4 == 3 # ..en for mod 3    yyyyyyyyyyyy,,fo
           #message = 'xxxx xxxx xxx.  .end   ..'    #% 4 == 2 # .end for mod 2     yyyyyyyyyyy,,foe
           #message = 'xxxx xxxx xx..  end. .'
