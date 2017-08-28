def fibonacci_last(nth)
  return 1 if nth <= 2
  last_nums = [1, 1]
  (3..nth).each do |index|
    last_nums << last_nums.sum % 10 # push the sum of last 2 digits onto array
    last_nums.shift # shift off the front of the array, leaving 2 digits again
  end
  last_nums.last
end

def fibonacci_last_instant(nth)
  fibonacci_last(nth % 60) # the fibonacci series has last digits that repeat over a 60-term cycle
end

puts fibonacci_last_instant(123_456_789_987_745) == 5
