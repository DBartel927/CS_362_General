# test_collapse.rb

require "minitest/autorun"
require_relative "collapse"

class TestCollapse < Minitest::Test
  def test_collapses_run_of_letter
    assert_equal "fo", collapse("fooooooo", "o")
  end

  def test_no_collapsing_needed
    assert_equal "hello", collapse("hello", "x")
  end

  def test_numbers
    assert_equal "98", collapse("988888888888", "8")
  end

  def test_separations
    assert_equal "54", collapse("454444444444", "4")
    assert_equal "545", collapse("44444444444544444444445", "4")
    assert_equal "454", collapse("455555555555554", "5")
  end

  def test_capitals
    assert_equal "aDd", collapse("aDddddddd", "d")
    assert_equal "aDd", collapse("aDDDDDDDd", "D")
  end

  def test_first_letter
    assert_equal "a", collapse("aaaaaa", "a")
  end
#   If the character to collapse is the first character, the code breaks.
end