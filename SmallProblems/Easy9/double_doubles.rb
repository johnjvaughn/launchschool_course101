def double_number?(number)
  num_string = number.to_s
  return false if num_string.size.odd?
  part1 = num_string[0,num_string.size/2]
  part2 = num_string[num_string.size/2..-1]
  part1 == part2
end

def twice(number)
  double_number?(number) ? number : 2 * number
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10