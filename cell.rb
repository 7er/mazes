class Cell
  attr_reader :row, :column
  attr_accessor :north, :south, :east, :west

  def initialize(row, column)
    @row, @column = row, column
    @links = {}
  end

  def distances
    result = Hash.new
    self.update_distances(self, 0, result)
    result
  end

  def update_distances(parent, distance, distances)
    distances[self] = distance
    self.links.each do |cell|
      cell.update_distances(self, distance + 1, distances) if parent != cell
    end
  end

  def link(cell, bidi=true)
    @links[cell] = true
    cell.link(self, false) if bidi
    self
  end

  def unlink(cell, bidi=true)
    @links.delete(cell)
    cell.unlink(self) if bidi
    self
  end

  def links
    @links.keys
  end

  def linked?(cell)
    @links.key?(cell)
  end

  def neighbors
    list = []
    [north, south, east, west].each do |dir|
      list << dir if dir
    end
    list
  end

  
end
