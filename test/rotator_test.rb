require "./test/test_helper"


class RotatorTest < MiniTest::Test

  CHARACTER_MAP = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']

  def setup
    @rotator = Rotator.new
  end

  def test_character_map_contains_the_proper_characters

    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                  "j", "k", "l", "m", "n", "o", "p", "q", "r",
                  "s", "t", "u", "v", "w", "x", "y", "z", "0",
                  "1", "2", "3", "4", "5", "6", "7", "8", "9",
                  " ", ".", ","], CHARACTER_MAP
  end

  def test_character_map_does_not_contain_duplicates

    assert_equal 39, CHARACTER_MAP.length
  end

end
