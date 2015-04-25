require "./test/test_helper"

class IOTest < MiniTest::Test

  def setup
    #message_file = 'test_msg.txt'
    @target_file = 'encrypted.txt'
    @msg = Encrypt.new#(message_file, @target_file)
  end


  def test_that_message_file_exists
    assert File.open('./test/test_msg.txt')
  end

  def test_that_simple_message_can_be_read
    input_file = './test/encrypt/test_msg.txt'
    message_text = Reader.read_file(input_file)
    assert_equal 'test', message_text
  end

  def test_that_different_message_can_be_read
    input_file = './test/test_msg2.txt'
     # msg2 = Encrypt.new#(message_filename, @target_file)
    msg_text = 'this is the 2nd msg.'
    message_text = Reader.read_file(input_file)

    assert_equal msg_text, message_text
  end
end
