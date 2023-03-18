
class BinaryTree
  def self.on(grid)
    instance = self.new(grid)
    instance.perform()
  end
  def initialize(grid)
    @grid = grid
  end

  def north(col, row)
    cell = @grid[col, row]
    cell.link(cell.north)
  end

  def east(col, row)
    cell = @grid[col, row]
    cell.link(cell.east)
  end

  def perform_
    @grid.each_cell do |cell|
      unless cell.north # top row
        self.east(cell) if cell.east
      end
      symbol = if cell.east
                 [:east, :north].sample
               else
                 :north
      self.send(symbol, cell)      
  end

  def perform
    (0...@grid.columns - 1).each do |col|
      self.east(0, col)      
    end
    (1...@grid.rows).each do |row|
      (0...@grid.columns - 1).each do |col|
          symbol = [:east, :north].sample
          self.send(symbol, row, col)
      end
      self.north(row, @grid.columns - 1)
    end
  end    
end
   
