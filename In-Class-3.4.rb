def set_color(color)
  # ... pretend ...
end

def draw_line(x0, y0, x1, y1)
  # ... pretend ...
end

# Part 1: def horizontal_line(y_pos, c = "blue")
def horizontal_line(y_pos)
  horizontal_line_color(y_pos)
end

def horizontal_line_color(y_pos, c = "blue")
  set_color(c)
  draw_line(0, y_pos, 100, y_pos)
  puts(c) # Just for debugging, removed in actual implementation
end

# Pretend there are a zillion calls to horizontal_line() out here

horizontal_line(120)
horizontal_line_color(120, "red")