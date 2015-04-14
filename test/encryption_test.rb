require "minitest"
require "minitest/autorun"
require './lib/encrypt'

class EncryptionTest < MiniTest::Test

  def setup
    message_file = 'test_msg.txt'
    @msg = Encrypt.new(message_file)
  end

  def test_it_has_a_character_map
    assert @msg.character_map
  end

  def test_character_map_contains_the_proper_characters
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                  "j", "k", "l", "m", "n", "o", "p", "q", "r",
                  "s", "t", "u", "v", "w", "x", "y", "z", "0",
                  "1", "2", "3", "4", "5", "6", "7", "8", "9",
                  " ", ".", ","], @msg.character_map
  end

  def test_character_map_does_not_contain_duplicates
    assert_equal 39, @msg.character_map.size
  end

  def test_that_message_file_exists
    assert File.open('test_msg.txt')
  end

  def test_that_simple_message_can_be_read
    assert_equal 'test', @msg.msg_text
  end

  def test_that_different_message_can_be_read
    @msg2 = Encrypt.new('test_msg2.txt')
    msg_text = 'This is the 2nd msg.'
    assert_equal msg_text, @msg2.msg_text
  end

  def test_for_newlines_after_every_word
    skip
  end

end
