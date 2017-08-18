def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size
    numbers[counter] *= 2
    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts "my_numbers: #{my_numbers}"
double_numbers!(my_numbers) 
puts "my_numbers: #{my_numbers}"
