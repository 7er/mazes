require 'grid'
require 'binary_tree'
require 'sidewinder'

def example1
  grid = Grid.new(4, 4)
  puts grid
  puts "\n"
  algorithm = BinaryTree.new(grid)
  algorithm.north(grid[3, 0])
  algorithm.east(grid[3, 1])
  algorithm.east(grid[3, 2])
  algorithm.north(grid[3, 3])
  puts grid
  puts "\n"
  algorithm.east(grid[2, 0])
  algorithm.north(grid[2, 1])
  algorithm.north(grid[2, 2])
  algorithm.north(grid[2, 3])
  puts grid
  puts "\n"
  algorithm.east(grid[1, 0])
  algorithm.north(grid[1, 1])
  algorithm.east(grid[1, 2])
  algorithm.north(grid[1, 3])
  puts grid
  puts "\n"
  algorithm.east(grid[0, 0])
  algorithm.east(grid[0, 1])
  algorithm.east(grid[0, 2])
  #algorithm.east(grid[0, 3])
  puts grid
  puts "\n"

end

def example2
  grid = Grid.new(10, 10)
  BinaryTree.on(grid)
  puts grid
  img = grid.to_png
  img.save("maze.png")
end

example1

example2

def sidewinder_demo
  grid = Grid.new(4, 4)
  Sidewinder.on(grid)
  puts grid
end

sidewinder_demo


