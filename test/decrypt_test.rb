require './test/test_helper'



class DecryptTest < MiniTest::Test

  def test_can_create_dycrypt_class
    assert Decrypt.new('key', 'date')
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
    key = '56648'
    date = '160415'

    encrypted_message = Decrypt.new(key , date)

    decrypted_text = encrypted_message.decrypt(encrypted_text)
    assert_equal 'help me', decrypted_text
  end

  def test_full_decryption
    input_file = './test/decrypt/test_message.txt'
    output_file = './test/decrypt/decrypted.txt'

    File.delete(output_file) if File.exist?(output_file)

    message_text = Reader.read_file(input_file)

    full_encrypt = Encrypt.new
    key = full_encrypt.encryption_key
    date = full_encrypt.date
    encrypted_text = full_encrypt.encrypt(message_text)

    full_decrypt = Decrypt.new(key, date)
    decrypted_text = full_decrypt.decrypt(encrypted_text)
    output = "Created #{output_file} with the key #{key} and the date #{date}"

    Writer.check_file(output_file, decrypted_text, true)

    assert_equal message_text, File.read(output_file)
    assert_equal output, full_decrypt.result(output_file)

  end
end


