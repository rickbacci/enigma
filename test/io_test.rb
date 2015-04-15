require "minitest"
require "minitest/autorun"
require './lib/encrypt'

class EncryptionTest < MiniTest::Test

  def setup
    message_file = 'test_msg.txt'
    @msg = Encrypt.new(message_file)
  end


  def test_that_message_file_exists
    assert File.open('test_msg.txt')
  end

  def test_that_simple_message_can_be_read
    assert_equal 'test', @msg.msg_text
  end

  def test_that_different_message_can_be_read
    @msg2 = Encrypt.new('test_msg2.txt')
    msg_text = 'This is the 2nd msg.'
    assert_equal msg_text, @msg2.msg_text
  end

  def test_for_newlines_after_every_word
    skip
  end
end
