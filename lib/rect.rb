# frozen_string_literal: true

require 'number_renderer'
require 'chunky_png'

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

