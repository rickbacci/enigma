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

  def test__can_decrypt_a_word
    encrypted_text = '07,3qc5'
    date = '160415'
    key_rotations =  [56, 66, 64, 48]
    date_offset =  @msg.date_offset(date)

    total_offset =  @msg.calculate_total_offset(date_offset, key_rotations)

    decrypted_text =  @msg.decrypt_text(encrypted_text, total_offset)

    assert_equal 'help me', decrypted_text
  end

  def test_full_decryption
    full_encrypt = Encrypt.new('./test/test_message.txt', './test/test_encrypted.txt')
    full_encrypt.encrypt
    key = full_encrypt.encryption_key
    date = full_encrypt.date
    full_decrypt = Decrypt.new('./test/test_encrypted.txt', './test/test_decrypted.txt', key, date)
    full_decrypt.decrypt
    assert_equal "full msg decryption working", File.read('./test/test_decrypted.txt')
  end
end


