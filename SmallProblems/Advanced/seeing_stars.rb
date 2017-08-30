def print_star(grid)
  grid.reverse.each { |line| puts line.join }
end

def star(odd_int)
  grid = Array.new(odd_int) { Array.new(odd_int, ' ') }
  halfway_point = (odd_int - 1) / 2

  grid.reverse.each_index do |y|
    grid[y].each_index do |x|
      if y == halfway_point || x == halfway_point || 
         y == x || y == odd_int - 1 - x
        grid[y][x] = '*'
      end
    end
  end

  print_star(grid)
end

star(7)
star(9)
star(15)