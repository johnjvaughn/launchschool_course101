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

def max_rotation(number)
  num_digits = number.to_s.size
  while num_digits > 1
    number = rotate_rightmost_digits(number, num_digits)
    num_digits -= 1
  end
  number
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
