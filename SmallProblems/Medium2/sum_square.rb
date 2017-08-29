def sum_square_difference(number)
  sum_of_squares = (1..number).map { |num| num**2 }.sum
  square_of_sum = (1..number).sum**2
  square_of_sum - sum_of_squares
end

puts sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150