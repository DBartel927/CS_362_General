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

# Why did the original test code fail half the time and not all the time?

# Because the tests were not independent; the state of the Counter class persisted between tests, causing interference.

# If you had to write a proverb that described the basics of what to do to make sure your tests are independent, what would that proverb be?

# "Always reset the world before testing."