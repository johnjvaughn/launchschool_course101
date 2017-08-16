puts("Enter two numbers separated by a space:")
numbers = gets.chomp().split()
numbers.map! { |num| num.to_f() }
puts("Perform which operation? Type + to add, - to subtract, * to multiply, or / to divide.")
operation = gets.chomp()
result = case operation
when '+'
  numbers[0] + numbers[1]
when '-'
  numbers[0] - numbers[1]
when '*'
  numbers[0] * numbers[1]
when '/'
  if numbers[1] == 0
    "Error, cannot divide by zero."
  else
    numbers[0] / numbers[1]
  end
else
  "Error, unknown operation."
end

puts("Answer: #{result}")
