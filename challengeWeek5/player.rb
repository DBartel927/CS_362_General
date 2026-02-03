class Player
  attr_reader :name

  def initialize(name, observer, observer2)
    @name = name
    @hit_points = 12
    @observer = observer
    @observer2 = observer2
  end

  def decrease_hp(n)
    @hit_points -= n
    @observer.on_hit_point_loss(self, n)
    @observer2.on_hit_point_loss(self, n)
  end
end

class Observer1
  def on_hit_point_loss(p, delta)
    puts "player #{p.name} has lost #{delta} hit points"
  end
end

class Observer2
  def on_hit_point_loss(p, delta)
    puts "Oh noes! Player #{p.name} has lost #{delta} HP"
  end
end

o1 = Observer1.new
o2 = Observer2.new

p = Player.new("Alfred", o1, o2)

p.decrease_hp(5)
p.decrease_hp(7)