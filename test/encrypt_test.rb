require './test/test_helper'


class EncryptTest < MiniTest::Test

  def setup
    message_file = 'test_msg.txt'
    @msg = Encrypt.new('test_msg.txt', 'encrypted.txt')
  end


  def test_encryption_key_is_created_and_within_range
    key = EncryptionKey.generate_key
    assert_equal 5, key.length
  end

  def test_date_offset
    test_date = '140415'
    assert_equal [2, 2, 2, 5], MessageDate.calculate_offset(test_date)
  end
end
