my_replacement = my_real_life_account_balance

class Foo
  def increase_balance()
    my_replacement += 1
  end
end

class Bar
  def decrease_balance()
    my_replacement -= 1
  end
end

def yay(n)
  my_replacement += n
end

def hey_wait(n)
  my_replacement -= n
end