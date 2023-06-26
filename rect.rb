class Rect
  def initialize(x1, y1, x2, y2)
    @x1 = x1
    @y1 = y1
    @x2 = x2
    @y2 = y2
    @horizontal_padding = 5
    @vertical_padding = 2
    @bar_length = 4
  end

  def draw_north(img, color)
    img.line(@x1, @y1, @x2, @y1, color)
  end

  def draw_west(img, color)
    img.line(@x1, @y1, @x1, @y2, color)
  end

  def draw_east(img, color)
    img.line(@x2, @y1, @x2, @y2, color)
  end

  def draw_south(img, color)
    img.line(@x1, @y2, @x2, @y2, color)
  end

  def draw_north_bar(img, color)
    top = @y1 + @vertical_padding
    img.line(@x1 + @horizontal_padding + 1, top, @x2 - (@horizontal_padding + 1), top, color)
  end

  def draw_south_bar(img, color)
    bottom = @y2 - @vertical_padding - 1
    img.line(@x1 + @horizontal_padding + 1, bottom, @x2 - (@horizontal_padding + 1), bottom, color)
  end

  def draw_middle_bar(img, color)
    middle = @y1 + (@y2 - @y1) / 2
    img.line(@x1 + @horizontal_padding + 1, middle, @x2 - (@horizontal_padding + 1), middle, color)
  end

  def draw_north_west_bar(img, color)
    start_y = @y1 + @vertical_padding + 1
    img.line(@x1 + @horizontal_padding, start_y, @x1 + @horizontal_padding, start_y + @bar_length - 1, color)
  end

  def draw_south_west_bar(img, color)
    start_y = @y1 + @vertical_padding + 2 + @bar_length
    img.line(@x1 + @horizontal_padding, start_y, @x1 + @horizontal_padding, start_y + @bar_length - 1, color)
  end

  def draw_north_east_bar(img, color)
    start_y = @y1 + @vertical_padding + 1
    img.line(@x2 - @horizontal_padding, start_y, @x2 - @horizontal_padding, start_y + @bar_length - 1, color)
  end

  def draw_south_east_bar(img, color)
    start_y = @y1 + @vertical_padding + 2 + @bar_length
    img.line(@x2 - @horizontal_padding, start_y, @x2 - @horizontal_padding, start_y + @bar_length - 1, color)
  end

  def draw_number(img, number, color) 
    case number
    when 0
      draw_north_bar(img, color)
      draw_north_west_bar(img, color)
      draw_north_east_bar(img, color)
      draw_south_bar(img, color)
      draw_south_west_bar(img, color)
      draw_south_east_bar(img, color)
    when 1
      draw_north_east_bar(img, color)
      draw_south_east_bar(img, color)
    when 2
      draw_north_bar(img, color)
      draw_north_east_bar(img, color)
      draw_middle_bar(img, color)
      draw_south_west_bar(img, color)
      draw_south_bar(img, color)
    when 3
      draw_north_bar(img, color)
      draw_north_east_bar(img, color)
      draw_middle_bar(img, color)
      draw_south_east_bar(img, color)
      draw_south_bar(img, color)
    when 4
      draw_north_west_bar(img, color)
      draw_middle_bar(img, color)
      draw_north_east_bar(img, color)
      draw_south_east_bar(img, color)
    when 5
      draw_north_bar(img, color)
      draw_north_west_bar(img, color)
      draw_middle_bar(img, color)
      draw_south_east_bar(img, color)
      draw_south_bar(img, color)
    when 6
      draw_north_bar(img, color)
      draw_north_west_bar(img, color)
      draw_south_west_bar(img, color)
      draw_south_bar(img, color)
      draw_south_east_bar(img, color)
      draw_middle_bar(img, color)
    when 7
      draw_north_west_bar(img, color)
      draw_north_bar(img, color)
      draw_north_east_bar(img, color)
      draw_south_east_bar(img, color)
    when 8
      draw_north_bar(img, color)
      draw_north_west_bar(img, color)
      draw_north_east_bar(img, color)
      draw_middle_bar(img, color)
      draw_south_bar(img, color)
      draw_south_west_bar(img, color)
      draw_south_east_bar(img, color)
    when 9
      draw_north_bar(img, color)
      draw_north_west_bar(img, color)
      draw_north_east_bar(img, color)
      draw_middle_bar(img, color)
      draw_south_bar(img, color)
      draw_south_east_bar(img, color)
    end
  end
end
