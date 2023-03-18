class Sidewinder
  def self.on(grid)
    instance = self.new(grid)
    instance.perform
  end

  def initialize(grid)
    @grid = grid
    @run = []
  end

  def north(row, column)
    @run << @grid[row, column]
    cell = @run.sample
    cell.link(cell.north)
    @run = []
  end

  def east(row, column)
    cell = @grid[row, column]
    @run << cell
    cell.link(cell.east)
  end

  def perform
    (0...@grid.columns - 1).each do |col|
      self.east(0, col)
      @run = [] # clear run on first line
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
