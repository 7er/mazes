
class BinaryTree
  def self.on(grid)
    instance = self.new(grid)
    instance.perform()
  end
  def initialize(grid)
    @grid = grid
  end

  def north(cell)
    cell.link(cell.north)
  end

  def east(cell)
    cell.link(cell.east)
  end

  def north_and_east_neighbors(cell)
    list = []
    [cell.north, cell.east].each do |dir|
      list << dir if dir
    end
    list
  end

  def perform
    @grid.each_cell do |cell|
      neighbor = north_and_east_neighbors(cell).sample
      neighbor.link(cell) if neighbor
    end
  end
end
   
