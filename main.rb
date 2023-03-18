require 'grid'
require 'binary_tree'
require 'sidewinder'

def example1
  grid = Grid.new(4, 4)
  puts grid
  puts "\n"
  algorithm = BinaryTree.new(grid)
  algorithm.north(3, 0)
  algorithm.east(3, 1)
  algorithm.east(3, 2)
  algorithm.north(3, 3)
  puts grid
  puts "\n"
  algorithm.east(2, 0)
  algorithm.north(2, 1)
  algorithm.north(2, 2)
  algorithm.north(2, 3)
  puts grid
  puts "\n"
  algorithm.east(1, 0)
  algorithm.north(1, 1)
  algorithm.east(1, 2)
  algorithm.north(1, 3)
  puts grid
  puts "\n"
  algorithm.east(0, 0)
  algorithm.east(0, 1)
  algorithm.east(0, 2)
  #algorithm.east(0, 3)
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

#example1

example2

def sidewinder_demo
  grid = Grid.new(4, 4)
  Sidewinder.on(grid)
  puts grid
end

sidewinder_demo


