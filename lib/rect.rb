# frozen_string_literal: true

# Helper for rendering a Cell to png
class CellRect
  attr_reader :cell, :x1, :x2, :y1, :y2, :img

  @wall = ChunkyPNG::Color::BLACK

  def initialize(cell, img, x1, y1, x2, y2)
    @x1 = x1
    @y1 = y1
    @x2 = x2
    @y2 = y2
    @img = img
    @cell = cell
  end

  def self.wall
    @wall
  end

  def wall
    self.class.wall
  end

  def draw_walls
    draw_north(wall) unless cell.north
    draw_west(wall) unless cell.west
    draw_east(wall) unless cell.linked?(cell.east)
    draw_south(wall) unless cell.linked?(cell.south)
  end

  def draw_north(color)
    @img.line(@x1, @y1, @x2, @y1, color)
  end

  def draw_west(color)
    @img.line(@x1, @y1, @x1, @y2, color)
  end

  def draw_east(color)
    @img.line(@x2, @y1, @x2, @y2, color)
  end

  def draw_south(color)
    @img.line(@x1, @y2, @x2, @y2, color)
  end

  def draw_number(number, color = ChunkyPNG::Color::BLACK)
    number_renderer = NumberRenderer.new(self, number, color)
    number_renderer.render
  end
end

# helper to render a number with a color in a cell rect
class NumberRenderer
  def initialize(cell_rect, number, color)
    @cell_rect = cell_rect
    @number = number
    @color = color
    @horizontal_padding = 5
    @vertical_padding = 2
    @bar_length = 4
  end

  def render
    case @number
    when 0
      draw_north_bar
      draw_north_west_bar
      draw_north_east_bar
      draw_south_bar
      draw_south_west_bar
      draw_south_east_bar
    when 1
      draw_north_east_bar
      draw_south_east_bar
    when 2
      draw_north_bar
      draw_north_east_bar
      draw_middle_bar
      draw_south_west_bar
      draw_south_bar
    when 3
      draw_north_bar
      draw_north_east_bar
      draw_middle_bar
      draw_south_east_bar
      draw_south_bar
    when 4
      draw_north_west_bar
      draw_middle_bar
      draw_north_east_bar
      draw_south_east_bar
    when 5
      draw_north_bar
      draw_north_west_bar
      draw_middle_bar
      draw_south_east_bar
      draw_south_bar
    when 6
      draw_north_bar
      draw_north_west_bar
      draw_south_west_bar
      draw_south_bar
      draw_south_east_bar
      draw_middle_bar
    when 7
      draw_north_west_bar
      draw_north_bar
      draw_north_east_bar
      draw_south_east_bar
    when 8
      draw_north_bar
      draw_north_west_bar
      draw_north_east_bar
      draw_middle_bar
      draw_south_bar
      draw_south_west_bar
      draw_south_east_bar
    when 9
      draw_north_bar
      draw_north_west_bar
      draw_north_east_bar
      draw_middle_bar
      draw_south_bar
      draw_south_east_bar
    end
  end

  def draw_north_bar
    top = @y1 + @vertical_padding
    @img.line(@x1 + @horizontal_padding + 1, top, @x2 - (@horizontal_padding + 1), top, wall)
  end

  def draw_south_bar
    bottom = @y2 - @vertical_padding - 1
    @img.line(@x1 + @horizontal_padding + 1, bottom, @x2 - (@horizontal_padding + 1), bottom, wall)
  end

  def draw_middle_bar
    middle = @y1 + (@y2 - @y1) / 2
    @img.line(@x1 + @horizontal_padding + 1, middle, @x2 - (@horizontal_padding + 1), middle, wall)
  end

  def draw_north_west_bar
    start_y = @y1 + @vertical_padding + 1
    @img.line(@x1 + @horizontal_padding, start_y, @x1 + @horizontal_padding, start_y + @bar_length - 1, wall)
  end

  def draw_south_west_bar
    start_y = @y1 + @vertical_padding + 2 + @bar_length
    @img.line(@x1 + @horizontal_padding, start_y, @x1 + @horizontal_padding, start_y + @bar_length - 1, wall)
  end

  def draw_north_east_bar
    start_y = @y1 + @vertical_padding + 1
    @img.line(@x2 - @horizontal_padding, start_y, @x2 - @horizontal_padding, start_y + @bar_length - 1, wall)
  end

  def draw_south_east_bar
    start_y = @y1 + @vertical_padding + 2 + @bar_length
    @img.line(@x2 - @horizontal_padding, start_y, @x2 - @horizontal_padding, start_y + @bar_length - 1, wall)
  end
end
