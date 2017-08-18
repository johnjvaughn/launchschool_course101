def factors(number)
  divisors = [] 
  dividend = number
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

numbers_to_try = [0, -14, 15, 23, 88]
numbers_to_try.each { |num| puts "Factors of #{num} are: #{factors(num)}" }

puts
puts "Bonus 1 Q. What is the purpose of the number % dividend == 0 ?"
puts <<-ANS
A. The modulo operator determines the remainder after division
   and if that is 0, then both dividend and (number / dividend) are
   factors of number.
ANS
puts <<-QUE2
Bonus 2 Q. What is the purpose of the second-to-last line in the method 
           (the divisors before the method's end)?
QUE2
puts "A. To make divisors the method's return value"
