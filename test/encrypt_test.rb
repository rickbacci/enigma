require './test/test_helper'


class EncryptTest < MiniTest::Test

  def setup
    @msg = Encrypt.new
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

    full_encrypt = Encrypt.new
    input_file = './test/encrypt/test_message.txt'
    output_file = './test/encrypt/test_decrypted.txt'
    message_text = Reader.read_file(input_file)

    encryption_key = full_encrypt.encryption_key
    date = full_encrypt.date
    encrypted_text = full_encrypt.encrypt(message_text)

    output = "Created #{output_file} with the key #{encryption_key} and the date #{date}"

    full_decrypt = Decrypt.new(encryption_key, date)
    decrypted_text = full_decrypt.decrypt(encrypted_text)

    assert_equal "full msg encryption working", decrypted_text
    assert_equal output, full_encrypt.result(output_file)
  end
end
