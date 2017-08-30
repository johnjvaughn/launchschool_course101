def transpose(matrix)
  # assuming matrix is square, but not necessarily 3x3
  dimen = matrix.size
  new_matrix = Array.new(dimen) { Array.new(dimen) }
  (0...dimen).each do |row|
    (0...dimen).each do |col| 
      new_matrix[col][row] = matrix[row][col]
    end
  end
  new_matrix
end

def transpose!(matrix)
  # assuming matrix is square, but not necessarily 3x3
  dimen = matrix.size
  (0...(dimen-1)).each do |row|
    ((row+1)...dimen).each do |col|
      matrix[col][row], matrix[row][col] = 
        matrix[row][col], matrix[col][row]
    end
  end
  matrix
end


matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

new_matrix = transpose!(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
