
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

  def perform
    @grid.each_cell do |cell|
      unless cell.north # top row
        self.east(cell) if cell.east
        next
      end
      symbol = if cell.east
                 [:east, :north].sample
               else
                 :north
               end
      self.send(symbol, cell)      
    end
  end
end
   
