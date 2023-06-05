class Sidewinder
  def self.on(grid)
    instance = self.new(grid)
    instance.perform
  end

  def initialize(grid)
    @grid = grid
    @run = []
  end

  def north(cell)
    @run << cell
    cell = @run.sample
    cell.link(cell.north)
    @run = []
  end

  def east(cell)
    @run << cell
    cell.link(cell.east)
  end

  def perform
    @grid.each_cell do |cell|
      if cell.north
        if cell.east
          direction = [:north, :east].sample
          self.send(direction, cell)
        else
          self.north(cell)
        end
      else # top row
        if cell.east
          self.east(cell)
        else
          @run = []
        end
      end
    end
  end

  def perform_old
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
