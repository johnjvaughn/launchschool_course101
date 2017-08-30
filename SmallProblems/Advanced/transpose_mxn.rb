def transpose(matrix)
  num_rows, num_cols = matrix.size, matrix[0].size
  new_matrix = Array.new(num_cols) { Array.new(num_rows) }
  (0...num_rows).each do |row|
    (0...num_cols).each do |col| 
      new_matrix[col][row] = matrix[row][col]
    end
  end
  new_matrix
end

puts transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
puts transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
puts transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
               [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
puts transpose([[1]]) == [[1]]
