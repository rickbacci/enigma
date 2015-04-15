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

  def test_encryption_key_is_created_and_within_range
    assert @msg.encryption_key
    assert_equal 5, @msg.encryption_key.length
  end

  def test_date_offset
    test_date = '140415'
    assert_equal '2225', @msg.date_offset(test_date)
  end
end
