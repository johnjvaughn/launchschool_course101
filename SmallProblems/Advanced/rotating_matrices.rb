def rotate90(matrix)
  num_rows, num_cols = matrix.size, matrix[0].size
  new_matrix = Array.new(num_cols) { Array.new(num_rows) }
  (0...num_rows).each do |row|
    (0...num_cols).each do |col| 
      new_matrix[col][row] = matrix[num_rows - row - 1][col]
    end
  end
  new_matrix
end

def rotate90multi_recursive(matrix, rotations=1)
  rotations = rotations % 4
  return matrix if rotations == 0
  num_rows, num_cols = matrix.size, matrix[0].size
  new_matrix = Array.new(num_cols) { Array.new(num_rows) }
  (0...num_rows).each do |row|
    (0...num_cols).each do |col| 
      new_matrix[col][row] = matrix[num_rows - row - 1][col]
    end
  end
  if rotations > 1
    rotate90multi_recursive(new_matrix, rotations - 1)
  else
    new_matrix
  end
end

def rotate90multi(matrix, rotations=1)
  return rotate90multi_recursive(matrix, rotations)
  rotations = rotations % 4
  return matrix if rotations == 0
  num_rows, num_cols = matrix.size, matrix[0].size
  if rotations == 2
    new_matrix = Array.new(num_rows) { Array.new(num_cols) }
  else
    new_matrix = Array.new(num_cols) { Array.new(num_rows) }
  end

  (0...num_rows).each do |row|
    (0...num_cols).each do |col|
      case rotations
      when 1
        new_matrix[col][row] = matrix[num_rows - row - 1][col]
      when 2
        new_matrix[row][col] = matrix[num_rows - row - 1][num_cols - col - 1]
      when 3
        new_matrix[col][row] = matrix[row][num_cols - col - 1]
      end
    end
  end
  new_matrix
end


matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1
# p new_matrix2

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2
p rotate90multi(matrix1, 1) == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p rotate90multi(matrix1, 2) == [[6, 9, 3], [2, 7, 4], [8, 5, 1]]
p rotate90multi(matrix1, 3) == [[8, 2, 6], [5, 7, 9], [1, 4, 3]]
p rotate90multi(matrix1, 8) == matrix1
p rotate90multi(matrix2, 1) == [[5, 3], [1, 7], [0, 4], [8, 2]]
p rotate90multi(matrix2, 2) == [[8, 0, 1, 5], [2, 4, 7, 3]]
p rotate90multi(matrix2, 3) == [[2, 8], [4, 0], [7, 1], [3, 5]]
p rotate90multi(matrix2, 0) == matrix2