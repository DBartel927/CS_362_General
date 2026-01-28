require 'minitest/autorun'

class Counter
  @@count = 0

  def self.increment
    @@count += 1
  end

  def self.count
    @@count
  end

  def self.reset
    @@count = 0
  end
end

class IndyTest < Minitest::Test
    def setup
        Counter.reset
    end

    def test_one
        assert_equal 0, Counter.count
    end

    def test_two
        Counter.increment
        assert_equal 1, Counter.count
    end
end