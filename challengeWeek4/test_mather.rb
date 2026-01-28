require_relative "mather.rb"
require "minitest/autorun"

class TestMather < Minitest::Test

  def test_sum
    m = Mather.new(1, 2)
    assert_equal 3, m.sum
  end

  def test_difference
    m = Mather.new(1, 2)
    assert_equal -1, m.difference
  end

  def test_quotient
    m = Mather.new(9, 3)
    assert_equal 3, m.quotient
  end

  def test_quotient_uneven
    m = Mather.new(10, 3)
    assert_in_delta 3, m.quotient
  end

  def test_quotient_by_zero
    m = Mather.new(1, 0)
    assert_raises(ZeroDivisionError) do
      m.quotient
    end
  end

end
