def is_odd?(number)
  # number % 2 == 1
  number.remainder(2) == 1
end

numbers = [2, 5, -17, -8, 0, 7]
numbers.each { |number| puts "#{number} is odd?  #{is_odd?(number)}" }
