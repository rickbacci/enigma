require "./test/test_helper"

class IOTest < MiniTest::Test

  def setup
    @target_file = './test/test_msg.txt'
    @msg = Encrypt.new
  end

  def test_that_message_file_exists
    assert File.read('./test/test_msg.txt')
  end

  def test_that_simple_message_can_be_read
    input_file = './test/encrypt/test_msg.txt'
    message_text = Reader.read_file(input_file)
    assert_equal 'test', message_text
  end

  def test_should_not_be_prompted_to_overwrite
    filename = './test/test.txt'
    text = 'you can\'t see me'
    Writer.check_file(filename, text, true)
    text = 'test successful'
    Writer.check_file(filename, text, true)

    assert_equal text, File.read(filename)
    File.delete(filename)
  end
end
