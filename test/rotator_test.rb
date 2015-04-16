require "minitest"
require "minitest/autorun"
require './lib/rotator'

class RotatorTest < MiniTest::Test

  def setup
    @rotator = Rotator.new
  end

  def test_it_has_a_character_map
    assert @rotator.character_map
  end

  def test_character_map_contains_the_proper_characters
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                  "j", "k", "l", "m", "n", "o", "p", "q", "r",
                  "s", "t", "u", "v", "w", "x", "y", "z", "0",
                  "1", "2", "3", "4", "5", "6", "7", "8", "9",
                  " ", ".", ","], @rotator.character_map
  end

  def test_character_map_does_not_contain_duplicates
    assert_equal 39, @rotator.character_map.size
  end

end
