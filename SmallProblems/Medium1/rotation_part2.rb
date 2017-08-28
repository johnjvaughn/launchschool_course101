def rotate_array(arr)
  return [] if arr.empty?
  newarr = arr.clone
  newarr << newarr.shift
end

def rotate_rightmost_digits(number, num_digits)
  number_arr = number.to_s.chars
  number_arr[-num_digits, num_digits] = \
    rotate_array(number_arr[-num_digits, num_digits])
  number_arr.join.to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917
