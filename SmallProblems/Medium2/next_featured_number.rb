def featured(number)
  index = number + 1
  index += 1 until index % 7 == 0 && index.odd?

  while index <= 9876543201
    return index if index.to_s.chars == index.to_s.chars.uniq
    index += 14
  end
  nil
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987
puts featured(9_999_999_999) == nil