# Declan Bartel, Exercise 3

class IceBoxRefrigerator

  attr_reader :height, :width, :depth

  def initialize(height = 0, width = 0, depth = 0)
    @height = height
    @width = width
    @depth = depth
  end

  def add(beverage)
  end
end

class BrokenRefrigerator

  attr_reader :height, :width, :depth

  def initialize(height = 0, width = 0, depth = 0)
    @height = height
    @width = width
    @depth = depth
  end

  def add(beverage)
  end

end

class RootBeer; end
class Kombucha; end

class Kitchen

  def initialize(refrigerator = IceBoxRefrigerator.new)
    @refrigerator = refrigerator
  end

  def add_beer_to_refrigerator
    add_drink_to_refrigerator(RootBeer.new)
  end

  def add_drink_to_refrigerator(beverage)
    @beverage = beverage
    @refrigerator.add(beverage)
  end

  def to_s
    puts "Kitchen. Fridge volume = #{fridge_volume} gallons"
    "Kitchen has a #{@refrigerator.class} with a #{@beverage.class} in it."
  end

  def fridge_volume
    fridge_volume = @refrigerator.height * @refrigerator.width * @refrigerator.depth * 7.48052
  end

end

# Current usage example:

kitchen = Kitchen.new
kitchen2 = Kitchen.new(BrokenRefrigerator.new)
kitchen.add_drink_to_refrigerator(RootBeer.new)
kitchen2.add_drink_to_refrigerator(Kombucha.new)
puts kitchen.to_s
puts kitchen2.to_s

# kitchen has an IceBoxRefrigerator with a RootBeer in it.

# Problem: you can't create a kitchen with a different fridge, and you can't
#          add any beverage other than beer.

# Goal: Create a kitchen with a BrokenRefrigerator, and add Kombucha to it.

