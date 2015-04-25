require './test/test_helper'

class CrackTest < Minitest::Test

  def setup
    @crack = CrackMessage.new
  end

  def test_crack_mod_4_equals_0_message
    message = 'oe,,'

    assert_equal [1, 1, 1, 1], @crack.crack_message(message)
  end

  def test_crack_mod_4_equals_1_message
    message = 'oe,,x'
    msg = @crack.send(:target_characters, message)

    chars = @crack.crack_message(msg)
    assert_equal [1, 1, 1, 1], chars
  end

  def test_crack_mod_4_equals_2_message
    message = 'oe,,xx'
    msg = @crack.send(:target_characters, message)

    chars = @crack.crack_message(msg)
    assert_equal [1, 1, 1, 1], chars
  end

  def test_crack_mod_4_equals_3_message
    message = 'oe,,xxx'
    msg = @crack.send(:target_characters, message)

    chars = @crack.crack_message(msg)
    assert_equal [1, 1, 1, 1], chars
  end

  def test_cracking_a_larger_message
    message = "apyrhi6nb3koli4o8v.e3tkn66rd646kf06k9i6u3xnq ind82nidinr,z4omszdmsnz3o1kli0umi7y ioxn4rd.z4i jkz 36ogrkomi0upjlkgole"
    msg = @crack.send(:target_characters, message)

    chars = @crack.crack_message(msg)

    assert_equal [32, 11, 13, 6], chars
  end
end

