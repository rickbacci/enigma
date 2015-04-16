require './test/test_helper'



class DecryptTest < MiniTest::Test

  def setup
    @msg = Decrypt.new('test_msg.txt', 'decrypted.txt', '11111', '150415')
  end

  def test_can_create_dycrypt_class
    assert @msg
  end

  def test_can_take_a_key_and_return_the_rotation
    key = '11111'
    assert_equal [11, 11, 11, 11], EncryptionKey.calculate_rotations(key)
  end

  def test_can_take_date_and_calculate_an_offset
    date = '150415'
    assert_equal [2, 2, 2, 5] , MessageDate.calculate_offset(date)
  end

  # def test_given_the_word_help_returns_bl39
  #   #'bl39'
  #   assert_equal 'help', @msg.convert
  # end

end


