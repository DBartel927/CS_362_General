class DebugDisplay
    def render_string(string)
        puts(string)
    end
end

class Display
  def initialize()
    @hardware = get_display_hardware()
    @cursor_pos = 0
  end

  def render_string(s)
    @hardware.add_string_at(@cursor_pos, s)
    @cursor_pos += s.length
  end
end

class Game
  def initialize(d)
    @display = d
  end

  def show_room()
    @display.render_string("You are standing in an open field west of a ")
    @display.render_string("white house, with a boarded front door.")
  end

  # ... more game functions ...
end

d = DebugDisplay.new
g = Game.new(d)
g.show_room()