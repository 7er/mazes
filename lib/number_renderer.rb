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
    top = @cell_rect.y1 + @vertical_padding
    @cell_rect.img.line(
      @cell_rect.x1 + @horizontal_padding + 1, top,
      @cell_rect.x2 - (@horizontal_padding + 1), top,
      @color
    )
  end

  def draw_south_bar
    bottom = @cell_rect.y2 - @vertical_padding - 1
    @cell_rect.img.line(
      @cell_rect.x1 + @horizontal_padding + 1, bottom,
      @cell_rect.x2 - (@horizontal_padding + 1), bottom,
      @color
    )
  end

  def draw_middle_bar
    middle = @cell_rect.y1 + (@cell_rect.y2 - @cell_rect.y1) / 2
    @cell_rect.img.line(
      @cell_rect.x1 + @horizontal_padding + 1, middle,
      @cell_rect.x2 - (@horizontal_padding + 1), middle,
      @color
    )
  end

  def draw_north_west_bar
    start_y = @cell_rect.y1 + @vertical_padding + 1
    @cell_rect.img.line(
      @cell_rect.x1 + @horizontal_padding, start_y,
      @cell_rect.x1 + @horizontal_padding, start_y + @bar_length - 1,
      @color
    )
  end

  def draw_south_west_bar
    start_y = @cell_rect.y1 + @vertical_padding + 2 + @bar_length
    @cell_rect.img.line(
      @cell_rect.x1 + @horizontal_padding, start_y,
      @cell_rect.x1 + @horizontal_padding, start_y + @bar_length - 1,
      @color
    )
  end

  def draw_north_east_bar
    start_y = @cell_rect.y1 + @vertical_padding + 1
    @cell_rect.img.line(
      @cell_rect.x2 - @horizontal_padding, start_y,
      @cell_rect.x2 - @horizontal_padding, start_y + @bar_length - 1,
      @color
    )
  end

  def draw_south_east_bar
    start_y = @cell_rect.y1 + @vertical_padding + 2 + @bar_length
    @cell_rect.img.line(
      @cell_rect.x2 - @horizontal_padding, start_y,
      @cell_rect.x2 - @horizontal_padding, start_y + @bar_length - 1,
      @color
    )
  end
end
