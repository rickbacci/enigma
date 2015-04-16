require "minitest"
require "minitest/autorun"
require './lib/encrypt'

class IOTest < MiniTest::Test

  def setup
    message_file = 'test_msg.txt'
    @target_file = 'encrypted.txt'
    @msg = Encrypt.new(message_file, @target_file)
  end


  def test_that_message_file_exists
    assert File.open('test_msg.txt')
  end

  def test_that_simple_message_can_be_read
    message_filename = './test/test_msg.txt'
    assert_equal 'test', @msg.get_file(message_filename)
  end

  def test_that_different_message_can_be_read
    message_filename = 'test_msg2.txt'
      @msg2 = Encrypt.new(message_filename, @target_file)
    msg_text = 'this is the 2nd msg.'
    assert_equal msg_text, @msg2.get_file(message_filename)
  end
end
