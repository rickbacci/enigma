require './test/test_helper'


class EncryptTest < MiniTest::Test

  def setup
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

  def test_full_encryption

    full_encrypt = Encrypt.new('./test/test_message.txt', './test/test_encrypted.txt')
    full_encrypt.encrypt
    key = full_encrypt.encryption_key
    date = full_encrypt.date

    full_decrypt = Decrypt.new('./test/test_encrypted.txt', './test/test_decrypted.txt', key, date)
    full_decrypt.decrypt

    assert_equal 'full msg encryption working', File.read('./test/test_message.txt')
  end
end
