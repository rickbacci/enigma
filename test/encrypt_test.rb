require './test/test_helper'


class EncryptTest < MiniTest::Test

  def setup
    @msg = Encrypt.new#('./test/encrypt/test_msg.txt', './test/encrypt/encrypted.txt')
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

    full_encrypt = Encrypt.new       #('./test/encrypt/test_message.txt', './test/encrypt/test_encrypted.txt')
    input_file = './test/encrypt/test_message.txt'
    #output_file = './test/encrypt/test_encrypted.txt'
    message_text = Reader.read_file(input_file)

    full_encrypt.encrypt(message_text)
    key = full_encrypt.encryption_key
    date = full_encrypt.date

    full_decrypt = Decrypt.new(key, date)
    full_decrypt.decrypt(message_text)

    assert_equal "full msg encryption working", File.read('./test/encrypt/test_message.txt').chomp
  end
end
