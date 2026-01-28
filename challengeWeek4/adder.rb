# adder.rb

# Not allowed to modify this file!

class AdderThing
  def very_expensive_method
    # Pretend this does something real
    sleep(10)
    raise "Failed to connect to adder server"
  end

  def adder(a, b)
    very_expensive_method()
    a + b
  end
end

# Production code:

if __FILE__ == $0
  at = AdderThing.new()
  puts at.adder(3, 7)
end