require 'pry'

class Slope
  def initialize(layout)
    @layout = layout
    @slope_width = layout.first.size
  end

  def traverse(move_right, move_down)
    trees_hit = 0
    current_x = move_right
    current_y = move_down

    until layout[current_y].nil?
      tile = layout[current_y][current_x]
      trees_hit += 1 if hit_tree?(tile)

      current_x = (current_x + move_right) % slope_width
      current_y += move_down
    end

    trees_hit
  end

  private

  attr_reader :layout, :slope_width

  def hit_tree?(tile)
    tile == '#'
  end
end
