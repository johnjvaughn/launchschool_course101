def sum_math_based(number)
  total = 0
  while number > 0
    total += number % 10
    number /= 10
  end
  total
end

def sum_my_str_based(number)
  total = 0
  number.to_s.chars.each { |char| total += char.to_i }
  total
end

def sum(number)
  number.to_s.chars.map(&:to_i).sum
end


test_nums = [23, 496, 123_456_789]
test_nums.each { |num| puts "#{num}: #{sum(num)}" }
