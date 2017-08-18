def multiply(numbers, factor)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter >= numbers.size

    multiplied_numbers << factor * numbers[counter]
    counter += 1
  end

  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p my_numbers
puts "after multiply: #{multiply(my_numbers, 3)}" # => [3, 12, 9, 21, 6, 18]