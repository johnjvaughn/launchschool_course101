def average(array_of_numbers)
  array_of_numbers.sum / array_of_numbers.size
end

def average_float(array_of_numbers)
  array_of_numbers.sum(0.0) / array_of_numbers.size
end

test_arrays = [[1, 5, 87, 45, 8, 8], [9, 47, 23, 95, 16, 52]]
test_arrays.each do |ary|
  puts "#{ary}: average (int) is #{average(ary)}"
  puts "#{ary}: average (float) is #{average_float(ary)}"
end
