# test_adder.rb

require 'minitest/autorun'
require_relative 'adder'

# For the challenge, don't modify anything in the AdderTest class:

class AdderTest < Minitest::Test
  def test_addr()
    at = AdderThing.new
    assert(at.adder(2, 3) == 5)
    assert(at.adder(-20, 19) == -1)
    assert(at.adder(0, 0) == 0)
  end
end

class AdderThing
    def very_expensive_method
    # Pretend this does something real
    print "I did it truly and really "
  end
end