borderWidth = 2

def init()
  widget_width = screen_width()
  boardWidth(widget_width)  # -2 for border
end

def on_resize(width)
  boardWidth(width)  # -2 for border
end

def boardWidth(width)
  board_width = width - borderWidth  # -2 for border
end