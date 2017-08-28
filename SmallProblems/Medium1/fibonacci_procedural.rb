def fibonacci(nth)
  return 1 if nth <= 2
  last_nums = [1, 1]
  (3..nth).each do |index|
    last_nums << last_nums.sum # push the sum of last 2 digits onto array
    last_nums.shift # shift off the front of the array, leaving 2 digits again
  end
  last_nums.last
end

puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
puts fibonacci(100_001) % 1000000 == 537501 # => 4202692702.....8285979669707537501