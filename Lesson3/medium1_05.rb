LIMIT = 15
puts "Changed 'limit' from a variable to a constant: 'LIMIT'"

def fib(first_num, second_num)
  while second_num < LIMIT
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"