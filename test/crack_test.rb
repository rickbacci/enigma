require './test/test_helper'

class CrackTest < Minitest::Test

  def setup
    @crack = CrackMessage.new

    # @message0 = 'xxxxx..end..' # mod 0
    # @message1 = 'xxxxxx..end..' # mod 1
    # @message2 = 'xxxxxxx..end..' # mod 2
    # @message3 = 'xxxxxxxx..end..' # mod 3

    # @mod0 = @crack.message_offset(@message0)
    # @mod1 = @crack.message_offset(@message1)
    # @mod2 = @crack.message_offset(@message2)
    # @mod3 = @crack.message_offset(@message3)
  end

  # def test_a_msg_can_be_encrypted
  #   message_text = 'test'
  #   total_offset = [1, 1, 1, 1]
  #   rotate = Rotator.encrypt(message_text, total_offset)
  #   assert_equal "uftu", rotate
  # end
  #
  # def test_correct_negative_mods_are_returned
  #   assert_equal  0, @mod0
  #   assert_equal -1, @mod1
  #   assert_equal -2, @mod2
  #   assert_equal -3, @mod3
  # end
  #
  # def test_can_calculate_the_proper_range_of_characters
  #   assert_equal -4..-1, @crack.select_range(@mod0)
  #   assert_equal -5..-2, @crack.select_range(@mod1)
  #   assert_equal -6..-3, @crack.select_range(@mod2)
  #   assert_equal -7..-4, @crack.select_range(@mod3)
  # end
  #
  # def test_can_return_the_proper_range_of_characters_to_search
  #   assert_equal 'nd..',@message0[@crack.select_range(@mod0)]
  #   assert_equal 'end.',@message1[@crack.select_range(@mod1)]
  #   assert_equal '.end',@message2[@crack.select_range(@mod2)]
  #   assert_equal '..en',@message3[@crack.select_range(@mod3)]
  # end
  #
  # def test_return_target_characters
  #   chars0 = @crack.target_characters(@message0)
  #   chars1 = @crack.target_characters(@message1)
  #   chars2 = @crack.target_characters(@message2)
  #   chars3 = @crack.target_characters(@message3)
  #
  #   assert_equal 'nd..', chars0
  #   assert_equal 'end.', chars1
  #   assert_equal '.end', chars2
  #   assert_equal '..en', chars3
  # end

  def test_crack_mod_4_equals_0_message
    message = 'oe,,'

    chars = @crack.crack_message(message)
    assert_equal [1, 1, 1, 1], chars
  end

  def test_crack_mod_4_equals_1_message
    message = 'oe,,,'
    msg = @crack.target_characters(message)

    chars = @crack.crack_message(msg)
    assert_equal [1, 1, 1, 1], chars
  end

  def test_crack_mod_4_equals_2_message
    message = 'oe,,,,'
    msg = @crack.target_characters(message)

    chars = @crack.crack_message(msg)
    assert_equal [1, 1, 1, 1], chars
  end

  def test_crack_mod_4_equals_3_message
    message = 'oe,,,,,'
    msg = @crack.target_characters(message)

    chars = @crack.crack_message(msg)
    assert_equal [1, 1, 1, 1], chars
  end
end
